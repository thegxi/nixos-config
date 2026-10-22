{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./modules
  ];

  nix.settings.trusted-users = ["root" "xi"];
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

  environment.systemPackages = with pkgs; [
    google-chrome
    pulseaudio
    pciutils # lspci
    ffmpeg
    libva
    libva-utils
    power-profiles-daemon
    neovim
    git
    curl
    wget
    bluez
    cachix
  ];
  programs.steam.enable = true;
  programs.steam.fontPackages = with pkgs; [source-han-sans];
  programs.zsh.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    TERMINAL = "kitty";
    # GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    QT5_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };

  # NOTE: 敏感环境变量加载 (ai_api_key等)
  age.identityPaths = [
    "/home/xi/.ssh/id_ed25519"
  ];
  # age.secrets."ai_api_key" = {
  #   file = ./secrets/ai_api_key.age;
  #   owner = "xi";
  # };

  users.users.xi = {
    description = "Xi";
    isNormalUser = true;
    home = "/home/xi";
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
    hashedPassword = "$y$j9T$2OIYhxfmYnmwdY0bMZDZl1$WMoaTny36wEf0vTafsRCpWBZ.mn7iV7Myr/Q02qSFM7";
    extraGroups = ["wheel" "networkmanager" "audio" "input" "video" "docker" "kvm" "libvirtd"];
  };
  security.sudo.wheelNeedsPassword = false; # sudo组是否需要密码

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Low-power CPUs use the kernel parameters below to avoid crashes
  boot.kernelParams = ["ahci.mobile_lpm_policy=1"];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "yes";
  services.timesyncd.enable = true;

  # U盘自动加载
  services.udisks2.enable = true;

  # networking
  networking.hostName = "cook";
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [
    5900
  ];

  # 禁用所有形式的睡眠和休眠
  systemd.sleep.settings.Sleep = {
    AllowSuspend = "yes"; # 如果只想禁用休眠，可以保持 Suspend 启用
    AllowHibernation = "no"; # 禁用休眠 (Hibernate)
    AllowHybridSleep = "no"; # 禁用混合睡眠 (Hybrid Sleep)
    AllowSuspendThenHibernate = "no"; # 禁用先睡眠后休眠
  };

  # timezone and local
  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_TIME = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_CTYPE = "zh_CN.UTF-8";
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = lib.mkDefault "us";
    useXkbConfig = true; # use xkb.options in tty.
  };

  fonts.packages = with pkgs; [
    maple-mono.NF-CN
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji

    bakoma_ttf
    cm_unicode
    newcomputermodern

    dejavu_fonts

    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.comic-shanns-mono
  ];

  fonts = {
    enableDefaultPackages = true;
    fontconfig = {
      enable = true;
      antialias = true;
      hinting = {
        enable = true;
	style = "slight";
      };
      subpixel = {
        rgba = "rgb";
	lcdfilter = "default";
      };
      defaultFonts = {
        monospace = ["Maple Mono NF CN"];
        serif = ["Noto Serif" "Noto Sans CJK SC"];
        sansSerif = ["Noto Sans" "Noto Serif CJK SC"];
      };
    };
  };

  # 窗口管理器
  programs.xwayland.enable = true;
  # Niri
  programs.niri.enable = true;
  # Hyprland
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };
  services.displayManager.gdm.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.xserver.enable = true;
  security.pam.services.gdm.enableGnomeKeyring = true;

  # Enable sound.
  services.pulseaudio.enable = false;
  # OR
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  hardware = {
    enableAllFirmware = true; # 自动安装所有固件
    cpu.intel.updateMicrocode = true; # Intel CPU
    # cpu.amd.updateMicrocode = true; # AMD CPU
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [
      intel-media-driver
      intel-vaapi-driver
    ];
  };

  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  system.stateVersion = "25.05";
}
