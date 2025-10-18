{
  # Git Configuration ( For Pulling Software Repos )
  gitUsername = "thexi";
  gitEmail = "village.cowherd@gmail.com";

  # Hyprland Settings
  # Configure your monitors here - this is host-specific
  # ex "monitor=HDMI-A-1, 1920x1080@60,auto,1"
  # You'll need to update this after installation based on your actual monitors
  extraMonitorSettings = ''
  monitor=DP-1,3440x1440@180.0,2740x1455,1.0
  monitor=DP-2,1920x1080@60.0,820x1714,1.0
  monitor=DP-3,1920x1080@60.0,6180x1714,1.0
  workspace=1,monitor:DP-1
  workspace=2,monitor:DP-2
  workspace=3,monitor:DP-3
  '';

  # Hyprland Plugin Settings
  hyprexpoSettings = {
    columns = 2;
    gap_size = 5;
    bg_col = "rgb(111111)";
    workspace_method = "center current";
    skip_empty = true;
    enable_gesture = true;
    gesture_fingers = 3;
    gesture_distance = 300;
    gesture_positive = true;
  };

  hyprscrollingSettings = {
    column_default_width = "onehalf";
    column_widths = "onehalf one";
    fullscreen_on_one_column = false;
    focus_fit_method = 1;
  };

  # Waybar Settings
  clock24h = false;

  # Program Options
  browser = "zen"; # Set Default Browser (google-chrome-stable for google-chrome)
  terminal = "kitty"; # Set Default System Terminal
  keyboardLayout = "us";
  consoleKeyMap = "us";

  # For Nvidia Prime support (update these IDs after hardware detection)
  # Run 'lspci | grep VGA' to find your actual GPU IDs
  intelID = "PCI:0:2:0";   # Update this with your actual integrated GPU ID
  nvidiaID = "PCI:1:0:0";  # Update this with your actual NVIDIA GPU ID

  # Enable/Disable Features
  enableNFS = true; # Enable NFS Support
  printEnable = false; # Enable Printing Support
  thunarEnable = true; # Enable Thunar File Manager
  controllerSupportEnable = true; # Enable Controller Support For Gaming
  flutterdevEnable = true; # Enable Flutter Development Environment
  stylix-enable = true; # Enable Stylix System Theming
  syncthing-enable = true; # Enable Syncthing File Synchronization
  enableDankMaterialShell = true; # Enable Dank Material Shell (disables waybar automatically)

  # Display Manager Options (choose one - add to host's default.nix)
  # services.greetd.enable = true;           # greetd with tuigreet (default)
  # services.displayManager.ly.enable = true; # ly with matrix animation

  # Styling
  stylix-image = ../../wallpapers/55.png;

  # Waybar Choice
  waybar-choice = ../../modules/home/waybar/waybar-jak-catppuccin.nix;

  # Animation Choice
  #animChoice = ../../modules/home/hyprland/animations-end4.nix;

  # Startup Applications
  startupApps = [
    "[workspace 3 silent] sleep 1 & vesktop"
    "[workspace 3 silent] telegram-desktop"
  ];
}
