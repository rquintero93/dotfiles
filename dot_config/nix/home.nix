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
  
  # programs.git = {
  #   enable = true;
  #   userName = "Ricardo Quintero";
  #   userEmail = "your.email@example.com";
  # };
  
  # programs.zsh = {
  #   enable = true;
  #   enableAutosuggestions = true;
  #   enableSyntaxHighlighting = true;
  # };
}
