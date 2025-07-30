{
  config,
  pkgs,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should manage
  home.username = "ricardoquintero";
  home.homeDirectory = "/Users/ricardoquintero";

  # Basic Home Manager configuration
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  # TPM installation
  home.activation.installTPM = ''
    if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
      echo "Cloning TPM..."
      ${pkgs.git}/bin/git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
    else
      echo "Updating TPM..."
      ${pkgs.git}/bin/git -C $HOME/.tmux/plugins/tpm pull
    fi
  '';

  home.activation.installANTIDOTE = ''
    if [ ! -d "$HOME/.antidote" ]; then
      echo "Cloning Antidote..."
      ${pkgs.git}/bin/git clone --depth=1 https://github.com/mattmc3/antidote.git $HOME/.antidote
    else
      echo "Updating Antidote..."
      ${pkgs.git}/bin/git -C $HOME/.antidote pull
    fi
  '';

  services.jankyborders = {
    enable = true;
    settings = {
      style = "round";
      width = 8.0;
      hidpi = "on";
      active_color = "0xFF89B4FA";
      inactive_color = "0xFF45475A";
      ax_focus = "on";
    };
  };

  programs.aerospace = {
    enable = true;
    userSettings = {
      start-at-login = true;
      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;
      accordion-padding = 40;

      default-root-container-layout = "tiles";

      default-root-container-orientation = "auto";
      on-focused-monitor-changed = ["move-mouse monitor-lazy-center"];

      key-mapping.preset = "qwerty";

      gaps = {
        inner.horizontal = 20;
        inner.vertical = 20;
        outer.left = 20;
        outer.bottom = 20;
        outer.top = 5;
        outer.right = 20;
      };

      mode.main.binding = {
        cmd-ctrl-alt-slash = "layout tiles horizontal vertical";
        cmd-ctrl-alt-alt-comma = "layout accordion horizontal vertical";

        cmd-ctrl-alt-h = "focus left";
        cmd-ctrl-alt-j = "focus down";
        cmd-ctrl-alt-k = "focus up";
        cmd-ctrl-alt-l = "focus right";

        cmd-ctrl-alt-shift-h = "move left";
        cmd-ctrl-alt-shift-j = "move down";
        cmd-ctrl-alt-shift-k = "move up";
        cmd-ctrl-alt-shift-l = "move right";

        cmd-ctrl-alt-shift-minus = "resize smart -50";
        cmd-ctrl-alt-shift-equal = "resize smart +50";

        cmd-ctrl-alt-1 = "workspace 1";
        cmd-ctrl-alt-2 = "workspace 2";
        cmd-ctrl-alt-3 = "workspace 3";
        cmd-ctrl-alt-4 = "workspace 4";

        cmd-ctrl-alt-shift-1 = "move-node-to-workspace 1";
        cmd-ctrl-alt-shift-2 = "move-node-to-workspace 2";
        cmd-ctrl-alt-shift-3 = "move-node-to-workspace 3";
        cmd-ctrl-alt-shift-4 = "move-node-to-workspace 4";
        cmd-ctrl-alt-shift-f = "fullscreen";
        cmd-ctrl-alt-tab = "workspace-back-and-forth";
        # alt-ctrl-tab = "move-workspace-to-monitor --wrap-around next";
        # alt-ctrl-shift-tab = "move-workspace-to-monitor --wrap-around prev";

        cmd-ctrl-alt-q = "close";

        cmd-ctrl-alt-shift-semicolon = "mode service";
      };

      mode.service.binding = {
        r = ["reload-config" "mode main"];
        esc = ["flatten-workspace-tree" "mode main"];
        f = [
          "layout floating tiling"
          "mode main"
        ];
        backspace = ["close-all-windows-but-current" "mode main"];

        cmd-ctrl-alt-shift-h = ["join-with left" "mode main"];
        cmd-ctrl-alt-shift-j = ["join-with down" "mode main"];
        cmd-ctrl-alt-shift-k = ["join-with up" "mode main"];
        cmd-ctrl-alt-shift-l = ["join-with right" "mode main"];

        down = "volume down";
        up = "volume up";
        shift-down = ["volume set 0" "mode main"];
      };

      workspace-to-monitor-force-assignment = {
        "1" = "built-in";
        "2" = "main";
        "3" = "^BK550Y$";
        "4" = "Z1";
      };

      on-window-detected = [
        {
          "if" = {
            app-id = "com.mitchellh.ghostty";
          };
          run = "move-node-to-workspace 2";
        }
        {
          "if" = {
            app-id = "net.kovidgoyal.kitty";
          };
          run = "move-node-to-workspace 2";
        }
        {
          "if" = {
            app-id = "dev.warp.Warp-Stable";
          };
          run = "move-node-to-workspace 2";
        }
        {
          "if" = {
            app-id = "org.alacritty";
          };
          run = "move-node-to-workspace 2";
        }
        {
          "if" = {
            app-id = "company.thebrowser.Browser";
          };
          run = "move-node-to-workspace 1";
          check-further-callbacks = true;
        }
        {
          "if" = {
            app-id = "org.mozilla.firefox";
          };
          run = "move-node-to-workspace 1";
          check-further-callbacks = true;
        }
        {
          "if" = {
            app-id = "app.zen-browser.zen";
          };
          run = "move-node-to-workspace 1";
          check-further-callbacks = true;
        }
        {
          "if" = {
            app-id = "com.microsoft.Outlook";
          };
          run = "move-node-to-workspace 4";
          check-further-callbacks = true;
        }
        {
          "if" = {
            app-id = "com.microsoft.team2";
          };
          run = "move-node-to-workspace 4";
          check-further-callbacks = true;
        }
        {
          "if" = {
            app-id = "ru.keepcoder.Telegram";
          };
          run = "move-node-to-workspace 4";
          check-further-callbacks = true;
        }
        {
          "if" = {
            app-id = "com.apple.MobileSMS";
          };
          run = "move-node-to-workspace 4";
          check-further-callbacks = true;
        }
        {
          "if" = {
            app-id = "net.whatsapp.WhatsApp";
          };
          run = "move-node-to-workspace 4";
          check-further-callbacks = true;
        }
        {
          "if" = {
            app-id = "com.apple.finder";
          };
          run = "layout floating";
        }
        {
          "if" = {
            app-id = "com.chabomakers.Antinote-setapp";
          };
          run = "layout floating";
        }
        {
          "if" = {
            window-title-regex-substring = "Picture-in-Picture";
          };
          run = "layout floating";
        }
      ];
    };
  };
}
