{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should manage
  home.username = "ricardoquintero";
  home.homeDirectory = "/Users/ricardoquintero";

  # Basic Home Manager configuration
  home.stateVersion = "23.11";
  
  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
  
  # Here you can add user-specific configurations
  # For example:
  services.jankyborders = {
      enable = true;
      settings = {
        style="round";
        width=8.0;
        hidpi="on";
        active_color="0xFF89B4FA";
        inactive_color="0xFF45475A";
        ax_focus="on";
      };

  };
  
  # programs.git = {
  #   enable = true;
  #   userName = "Ricardo Quintero";
  #   userEmail = "your.email@example.com";
  # };
  
  # programs.zsh = {
  #   enable = true;
  #   antidote = {
  #     enable = true;
  #     plugins =  [''
  #
  #       romkatv/zsh-defer
  #       ohmyzsh/ohmyzsh path:plugins/colorize
  #       zsh-users/zsh-history-substring-search
  #       ohmyzsh/ohmyzsh path:plugins/colored-man-pages
  #       ohmyzsh/ohmyzsh path:plugins/zsh-interactive-cd
  #       reegnz/jq-zsh-plugin
  #       hlissner/zsh-autopair
  #       Aloxaf/fzf-tab
  #       mattmc3/ez-compinit
  #       zsh-users/zsh-autosuggestions
  #       zdharma-continuum/fast-syntax-highlighting
  #       zsh-users/zsh-completions kind:fpath path:src
  #       belak/zsh-utils path:completion
  #
  #     ''
  #     ];
  #   };
  # };
}
