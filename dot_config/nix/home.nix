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
  
  programs.aerospace = {
    enable = true;
    userSettings = {
      start-at-login = true;
      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;
      accordion-padding = 20;

      default-root-container-layout = "accordion";
      
      default-root-container-orientation = "auto";
      on-focused-monitor-changed = ["move-mouse monitor-lazy-center"];

      key-mapping.preset = "qwerty";

      gaps = {
        inner.horizontal = 20;
        inner.vertical = 20;
        outer.left = 20;
        outer.bottom = 20;
        outer.top = 20;
        outer.right = 20;
      };

      mode.main.binding = {
        alt-slash = "layout tiles horizontal vertical";
        alt-comma = "layout accordion horizontal vertical";

        alt-h = "focus left";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";

        alt-shift-h = "move left";
        alt-shift-j = "move down";
        alt-shift-k = "move up";
        alt-shift-l = "move right";

        alt-shift-minus = "resize smart -50";
        alt-shift-equal = "resize smart +50";

        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";

        alt-shift-1 = "move-node-to-workspace 1";
        alt-shift-2 = "move-node-to-workspace 2";
        alt-shift-3 = "move-node-to-workspace 3";
        alt-shift-4 = "move-node-to-workspace 4";
        alt-shift-f = "fullscreen";
        alt-tab = "workspace-back-and-forth";
        alt-ctrl-tab = "move-workspace-to-monitor --wrap-around next";
        alt-ctrl-shift-tab = "move-workspace-to-monitor --wrap-around prev";

        alt-q = "close";

        alt-shift-semicolon = "mode service";
      };

      mode.service.binding = {
        esc = ["reload-config" "mode main"];
        r = ["flatten-workspace-tree" "mode main"];
        f = [
            "layout floating tiling"
            "mode main"
        ];
        backspace = ["close-all-windows-but-current" "mode main"];


        alt-shift-h = ["join-with left" "mode main"];
        alt-shift-j = ["join-with down" "mode main"];
        alt-shift-k = ["join-with up" "mode main"];
        alt-shift-l = ["join-with right" "mode main"];

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
        }
        {
          "if" = {
            app-id = "org.mozilla.firefox";
          };
          run = "move-node-to-workspace 1";
        }
        {
          "if" = {
            app-id = "app.zen-browser.zen";
          };
          run = "move-node-to-workspace 1";
        }
        {
          "if" = {
            app-id = "com.microsoft.Outlook";
          };
          run = "move-node-to-workspace 4";
        }
        {
          "if" = {
            app-id = "com.microsoft.team2";
          };
          run = "move-node-to-workspace 4";
        }
        {
          "if" = {
            app-id = "ru.keepcoder.Telegram";
          };
          run = "move-node-to-workspace 4";
        }
        {
          "if" = {
            app-id = "com.apple.MobileSMS";
          };
          run = "move-node-to-workspace 4";
        }
        {
          "if" = {
            app-id = "net.whatsapp.WhatsApp";
          };
          run = "move-node-to-workspace 4";
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
            window-title-regex-substring = "^Picture-in-Picture$";
          };
          run = "layout floating";
        }
      ];
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
