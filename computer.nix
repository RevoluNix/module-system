{ username, computer, home-manager }:
{ config, ... }:
{
###########
# Imports #
#######################################################################
  imports = [
    (import ./config {
      inherit computer username;
    })
    ## ------------------------------------------------------------- ##
    home-manager.nixosModules.home-manager {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup2";
        users.${username} = (import ./home {
          inherit username;
          hostname = computer.hostname;
        });
      };
    }
  ];
#######################################################################
}

