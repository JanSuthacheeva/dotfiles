return {
    lightgrey = 0xFFB0B0B0,
    lightwhite = 0xFFFFFFFF,
    black = 0xff181819,
    white = 0xffe2e2e3,
    red = 0xfffc5d7c,
    green = 0xff9ed072,
    blue = 0xff76cce0,
    yellow = 0xffe7c664,
    orange = 0xfff39660,
    magenta = 0xffb39df3,
    grey = 0xff7f8490,
    transparent = 0x00000000,

    bar = {
        bg = 0xcc1a1b26,
        border = 0xff2c2e34
    },
    popup = {
        bg = 0xc02c2e34,
        border = 0xff7f8490
    },
    bg1 = 0xff363944,
    bg2 = 0xff414550,

    pill_green = 0xffabeab4,
    pill_pink = 0xffa04065,
    pill_blue = 0xff4065a0,
    pill_purple = 0xff6540a0,
    pill_mauve = 0xffa06585,
    pill_cpu = 0xff96cdfb,
    pill_mem = 0xffddb7f2,
    pill_disk = 0xfff5c2e7,
    pill_temp = 0xfff8be96,

    rainbow = {0xffff007c, 0xffc53b53, 0xffff757f, 0xff41a6b5, 0xff4fd6be, 0xffc3e88d, 0xffffc777, 0xff9d7cd8,
               0xffff9e64, 0xffbb9af7, 0xff7dcfff, 0xff7aa2f7},

    with_alpha = function(color, alpha)
        if alpha > 1.0 or alpha < 0.0 then
            return color
        end
        return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
    end
}
