{ config, pkgs, lib, ... }:

let
  batteryPath = "/sys/class/power_supply/BAT0/charge_control_end_threshold";
  chargeThreshold = 80;
in

{
  systemd.services.battery-charge-threshold = {
    description = "Set the battery charge threshold";
    after = [ "multi-user.target" ];
    startLimitBurst = 0;
    serviceConfig = {
      Type = "oneshot";
      Restart = "on-failure";
      ExecStart = "${pkgs.bash}/bin/bash -c 'echo ${toString chargeThreshold} > ${batteryPath}'";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
