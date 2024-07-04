{ pkgs, ... }:
{
#########
# Files #
#######################################################################
  home.file = {
    xinitrc = {
      source = ./src/.xinitrc;
      target = ".xinitrc";
    };
    user-dirs = {
      source = ./src/user-dirs.dirs;
      target = ".config/user-dirs.dirs";
    };
    bashrc = {
      source = ./src/.bashrc;
      target = ".bashrc";
    };
    vimrc = {
      source = ./src/.nvimrc;
      target = ".nvimrc";
    };
    onedark_prompt = {
      source = ./src/.onedark_prompt.sh;
      target = ".config/.onedark_prompt.sh";
    };
    dircolors = {
      source = ./src/.dircolors;
      target = ".config/.dircolors";
    };
    profile = {
      source = ./src/.profile;
      target = ".profile";
    };
  };
########################################################################
}
