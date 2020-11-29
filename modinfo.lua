name = "Damage Indicators Together"
description = "Baaaaam Baam. Take that, nasty brute of hell!"
author = "s1m13, ported by DarkXero"
version = "0.13.3"
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
        label = "Show Heal",
        hover = "Show green numbers when a player or mob is healed.",
        options = {
            { description = "On", data = "off" },
            { description = "Off", data = "on" },
        },
        default = "on",
    },

    {
        name = "display_mode",
        label = "Display Mode",
        hover = "Decide how the numbers are moving.",
        options = {
            { description = "Waving", data = "waving" },
            { description = "Straight", data = "straight" },
            { description = "Bouncy", data = "bouncy" },
            { description = "Rocket", data = "rocket" },
        },
        default = "waving",
    },


    {
        name = "amount_of_numbers",
        label = "Amount of Numbers",
        hover = "Choose whether all numbers are shown or ones larger than one.",
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
        hover = "Decide whether numbers are shown as '0' or '0.4'.",
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
            { description = "Atomic", data = "atomic" },            
            { description = "Tiny", data = "tiny" },
            { description = "Default", data = "default" },
            { description = "Huge", data = "huge" },
        },
        default = "default",
    },

    {
        name = "size_scale",
        label = "Scale number size with damage",
        hover = "Decide whether numbers should appear larger when the damage amound is higher.",
        options = {
            { description = "On", data = "default" },
            { description = "Off", data = "off" },
        },
        default = "default",
    },

    {
        name = "number_duration",
        label = "Show numbers a shorter time",
        hover = "Decide whether numbers should be visible for a shorter or longer duration.",
        options = {
            { description = "Longer", data = "long" },
            { description = "Default", data = "default" },
            { description = "Shorter", data = "short" },
        },
        default = "default",
    },

    {
        name = "show_hunger",
        label = "Show Hunger Indicators",
        hover = "Show numbers on changing hunger. (+beefelo hunger, +penguin hunger)",
        options = {
            { description = "On", data = "on" },
            { description = "Off", data = "off" },
        },
        default = "off",
    },
    
    {
        name = "show_sanity",
        label = "Show Sanity Indicators",
        hover = "Show numbers on any changing sanity.",
        options = {
            { description = "On", data = "on" },
            { description = "Off", data = "off" },
        },
        default = "off",
    },

    {
        name = "show_moisture",
        label = "Show Wetness Indicators",
        hover = "Show numbers on any changing wetness/moisture. Be aware that small changes over time will not always be shown. Change 'Amount of numbers' for that.",
        options = {
            { description = "On", data = "on" },
            { description = "Off", data = "off" },
        },
        default = "off",
    },
    
    {
        name = "show_beaverness",
        label = "Show Beaverness Indicators",
        hover = "Show numbers on changes of Woodies beaverness scale while chopping trees.",
        options = {
            { description = "On", data = "on" },
            { description = "Off", data = "off" },
        },
        default = "off",
    },

    {
        name = "show_work",
        label = "Show Work Indicators",
        hover = "Show numbers on any change while working. This affects trees, boulders, hammering structures etc.",
        options = {
            { description = "On", data = "on" },
            { description = "Off", data = "off" },
        },
        default = "off",
    },

    {
        name = "show_fueled",
        label = "Show Fueled Indicators",
        hover = "Show numbers on any change of fuels in firepits and so on.",
        options = {
            { description = "On", data = "on" },
            { description = "Off", data = "off" },
        },
        default = "off",
    },

}
