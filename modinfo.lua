name = "Damage Indicators Together"
description = "Baaaaam Baam. Take that, nasty brute of hell!"
author = "s1m13, ported by DarkXero"
version = "0.7.0"
forumthread = "/topic/87910-damage-indicators-together/"
api_version = 10
dont_starve_compatible = false
reign_of_giants_compatible = false
dst_compatible = true
icon_atlas = "damageindicators.xml"
icon = "damageindicators.tex"
all_clients_require_mod = true
client_only_mod = false
server_filter_tags = { "damage indicators", "floating numbers" }


configuration_options =
{
    {
        name = "dmg_only",
        label = "Show Damage Only",
        options = {
            { description = "On", data = "on" },
            { description = "Off", data = "off" },
        },
        default = "on",
    },

    {
        name = "display_mode",
        label = "Display Mode",
        options = {
            { description = "Bouncy", data = "bouncy" },
            { description = "Waving", data = "waving" },
            { description = "Straight", data = "straight" },
        },
        default = "waving",
    },


    {
        name = "amount_of_numbers",
        label = "Amount of Numbers",
        options = {
            { description = "Low", data = "low" },
            { description = "Default", data = "default" },
            { description = "High", data = "high" },
        },
        default = "default",
    },

    {
        name = "show_decimal_points",
        label = "Show Decimal Points for",
        options = {
            { description = "No Numbers", data = "no" },
            { description = "Low Numbers", data = "low" },
            { description = "All Numbers", data = "all" },
        },
        default = "no",
    },

    {
        name = "number_size",
        label = "Number size",
        options = {
            { description = "Tiny", data = "tiny" },
            { description = "Default", data = "default" },
            { description = "Huge", data = "huge" },
        },
        default = "default",
    }
}
