# decoration config
{
    # decoration = {
    #     rounding = 10;
    #     rounding_power = 2;
    #     active_opacity = 1.0;
    #     inactive_opacity = 1.0;
    #     shadow = {
    #         enabled = true;
    #         range = 4;
    #         render_power = 3;
    #         color = "rgba(1a1a1aee)";
    #     };
    #     blur = {
    #         enabled = true;
    #         size = 3;
    #         passes = 1;
    #         vibrancy = 0.1696;
    #     };
    # };

    decoration = {
        rounding = 10;

        blur = {
            enabled = true;
            xray = false;
            special = false;
            ignore_opacity = true;  # Allows opacity blurring
            new_optimizations = true;
            popups = true;
            input_methods = true;
        };

        shadow = {
            enabled = true;
        };
    };
}