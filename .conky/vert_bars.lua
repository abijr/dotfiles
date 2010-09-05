--[[ 
    conky vertical bar graph
    by iggykoopa mods by arpinux(2009)

       most of the credit goes to londonali1010, I stole big chunks from her ring graphs
]]

require 'cairo'

settings_table = {
{
    -- Edit this table to customise your bars.
    -- You can create more bars simply by adding more elements to settings_table.
    -- "name" is the type of stat to display; you can choose from 'cpu', 'memperc', 'fs_used_perc', 'battery_used_perc'.
    name='battery_percent',
    -- "arg" is the argument to the stat type, e.g. if in Conky you would write ${cpu cpu0}, 'cpu0' would be the argument. If you would not use an argument in the Conky variable, use ''.
    arg='',
    -- "max" is the maximum value of the bar. If the Conky variable outputs a percentage, use 100.
    max=100,
    -- set width, height, and position here
    width = 15,
    height = 50,
    x = 151,
    y = 0,
    -- set colors here 0-1 for intensity
    borderRed = 1,
    borderGreen = 1,
    borderBlue = 1,
    fillRed = 1,
    fillGreen = 1,
    fillBlue = 1
},
{
    name='cpu',
    arg='',
    max=100,
    width = 15,
    height = 40,
    x = 181,
    y = 0,
    borderRed = 1,
    borderGreen = 1,
    borderBlue = 1,
    fillRed =0.3,
    fillGreen =0.3,
    fillBlue = 0.3
},
{
    name='memperc',
    arg='',
    max=100,
    width = 15,
    height = 40,
    x = 211,
    y = 0,
    borderRed = 1,
    borderGreen = 1,
    borderBlue = 1,
    fillRed =0.3,
    fillGreen =0.3,
    fillBlue = 0.3
},
{
    name='downspeedf',
    arg='eth0',
    max=1000,
    width = 15,
    height = 40,
    x = 241,
    y = 0,
    borderRed = 1,
    borderGreen = 1,
    borderBlue = 1,
    fillRed =0.3,
    fillGreen =0.3,
    fillBlue = 0.3
},
{
    name='upspeedf',
    arg='600',
    max=80,
    width = 15,
    height = 40,
    x = 271,
    y = 0,
    borderRed = 1,
    borderGreen = 1,
    borderBlue = 1,
    fillRed =0.3,
    fillGreen =0.3,
    fillBlue = 0.3
},
{
    name='ibm_temps',
    arg='3',
    max=80,
    width = 25,
    height = 50,
    x = 451,
    y = 0,
    borderRed = 1,
    borderGreen = 1,
    borderBlue = 1,
    fillRed =0.3,
    fillGreen =0.3,
    fillBlue = 0.3
},
}

function draw_bar(pct, pt)
    local cs=cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
    cr=cairo_create(cs)
    cairo_set_source_rgb (cr, pt['borderRed'], pt['borderGreen'], pt['borderBlue'])
    cairo_set_line_width (cr, 0)
    cairo_rectangle (cr, pt['x'], pt['y'], pt['width'], pt['height'])
    cairo_stroke (cr)
    cairo_set_source_rgb (cr, pt['fillRed'], pt['fillGreen'], pt['fillBlue'])
    cairo_set_line_width (cr, pt['width'] - 2)
    cairo_move_to (cr, (pt['width'] / 2) + pt['x'], pt['height'] + pt['y'] - 1)
    cairo_line_to (cr, (pt['width'] / 2) + pt['x'], pt['height'] - (pt['height'] * pct) + pt['y'] - 1)
    cairo_stroke (cr)
    cairo_destroy(cr)
    cr = nil
end

function conky_bar_stats()
    local function setup_bars(pt)
        local str=''
        local value=0

        str=string.format('${%s %s}',pt['name'],pt['arg'])
        str=conky_parse(str)
    
        value=tonumber(str)
        pct=value/pt['max']

        draw_bar(pct,pt)
    end

    if conky_window == nil then return end
    local updates=conky_parse('${updates}')
    update_num=tonumber(updates)


    if update_num>5 then
        for i in pairs(settings_table) do
            setup_bars(settings_table[i])
        end
    end
end
