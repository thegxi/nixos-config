{ host, ... }: {
  imports = [
    ../../hosts/${host}
    ./nvidia-drivers.nix    
    ../../modules/core
  ];
  # Enable GPU Drivers
  drivers.amdgpu.enable = false;
  drivers.nvidia.enable = true;
  drivers.nvidia-prime.enable = false;
  drivers.intel.enable = false;
  vm.guest-services.enable = false;
}
