{ computer, username }:
{ config, pkgs, ... }:
{
###########
# Imports #
#######################################################################
  imports =
    [
      (import ./services.nix {
        inherit username;
        hostname = computer.hostname;
      })
      ./programs.nix
      ./issue
      ./polkit
      ./boot.nix
    ];
##########
# System #
#######################################################################
  system = {
    copySystemConfiguration = false;
    stateVersion = "24.05";
  };
  # ----------------------------------------------------------------- #
  hardware.opentabletdriver.enable = true;
  # ----------------------------------------------------------------- #
  documentation.dev.enable = true;
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    ## ------------------------------------------------------------- ##
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "root" "@wheel" ];
      keep-outputs = true;
      keep-derivations = true;
      auto-optimise-store = true;
      warn-dirty = false;
    };
    ## ------------------------------------------------------------- ##
    optimise.automatic = true;
  };
  # ----------------------------------------------------------------- #
  security.sudo.wheelNeedsPassword = false;
  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "fr_FR.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };
  # ----------------------------------------------------------------- #
  nixpkgs.config.allowUnfree = true;
########
# User #
#######################################################################
  users.users.${username} = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "docker"
      "networkmanager"
      "libvirtd"
      "wheel"
      "corectrl"
    ];
    initialPassword = "admin";
  };
##################
# Virtualisation #
#######################################################################
  virtualisation = {
    docker.enable = true;
  };
#######################################################################
}
