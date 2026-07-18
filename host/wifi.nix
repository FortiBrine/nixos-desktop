{ config, pkgs, ... }: {
  boot.extraModulePackages = with config.boot.kernelPackages; [
    rtl8821ce
  ];

  boot.kernelModules = [ "8821ce" ];

  boot.blacklistedKernelModules = [
    "rtw88_8821ce"
    "rtw88_8821c"
    "rtw88_core"
    "rtw88_pci"
  ];

  boot.extraModprobeConfig = ''
    options 8821ce aspm=0 rtw_power_mgnt=0 rtw_enusbss=0 rtw_ips_mode=0
  '';
}
