{
    monitor = [
        "eDP-1,1920x1080@144,0x0,1"
        # ",3840x2160@60,auto,1,mirror,eDP-1"
    ];

    general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 1;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
    };

    group = {
        groupbar = {
          font_family = "JetBrains Mono NF";
          font_size = 15;
          gradients = true;
          gradient_round_only_edges = false;
          gradient_rounding = 5;
          height = 25;
          indicator_height = 0;
          gaps_in = 3;
          gaps_out = 3;
        };
    };

    dwindle = {
        pseudotile = true;
        preserve_split = true;
    };

    master = {
        new_status = "master";
    };

    misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
        vrr = 1;
        vfr = true;
        animate_manual_resizes = false;
        animate_mouse_windowdragging = false;

        new_window_takes_over_fullscreen = true;
        allow_session_lock_restore = true;
        middle_click_paste = false;

        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
    };

    debug = {
        error_position = 1;
    };

    input = {
        kb_layout = "gb";
        kb_variant = "";
        kb_model = "";
        kb_options = "caps:swapescape";
        kb_rules = "";
        follow_mouse = 1;
        sensitivity = -0.7;
        accel_profile = "flat";
        touchpad = {
            natural_scroll = true;
        };
    };

    gestures = {
        workspace_swipe = false;
    };

    device = [
        {
            name = "logitech-g305-1";
            enabled = true;
        }
        {
            name = "etps/2-elantech-touchpad";
            enabled = false;
        }
        {
            name = "elan0412:01-04f3:3240-touchpad";
            enabled = false;
        }
    ];
        xwayland = {
            force_zero_scaling = true;
        };
}