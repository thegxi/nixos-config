{
  config,
  pkgs,
  ...
}: {
  #### systemd user env loader ####
  systemd.user.services.env-loader = {
    description = "Load API keys from agenix into graphical session";
    wantedBy = ["graphical-session-pre.target"];
    before = ["graphical-session.target"];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = pkgs.writeShellScript "env-loader" ''
          SECRET_FILE="${config.age.secrets.ai_api_key.path}"
          if [ -f "$SECRET_FILE" ]; then
          # 1. 临时开启自动导出功能，并 source 文件
          set -a
          . "$SECRET_FILE"
          set +a

          # 2. 提取文件中的变量名 (匹配等号左边的字符)
          VARS=$(grep -oP '^[a-zA-Z_][a-zA-Z0-9_]*(?==)' "$SECRET_FILE")

          # 3. 将变量注入 D-Bus (解决 Rofi/GUI 应用识别问题)
          ${pkgs.dbus}/bin/dbus-update-activation-environment --systemd $VARS

          # 4. 同步到 systemd 用户环境
          for var in $VARS; do
            val=$(eval echo \$$var)
            ${pkgs.systemd}/bin/systemctl --user set-environment "$var"="$val"
          done
        fi
      '';
    };
  };
}
