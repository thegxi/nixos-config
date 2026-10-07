_: {
  programs.clash-verge = {
    enable = true;
    # package = pkgs-unstable.clash-verge-rev;
    autoStart = true;
    tunMode = true;
    serviceMode = true;
  };

  # Configure network proxy if necessary
  # 系统级代理设置
  networking.proxy = {
    default = "http://127.0.0.1:7897";
    httpProxy = "http://127.0.0.1:7897";
    httpsProxy = "http://127.0.0.1:7897";
    noProxy = "localhost,127.0.0.1,::1,*.local";
  };
}
