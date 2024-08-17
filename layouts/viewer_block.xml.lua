local HUD = require('qWAYLA:viewer_hud')

HUD.set_block_handler(function(x, y, z, id)
    local picking_item = block.get_picking_item(id)
    local is_item = picking_item and picking_item ~= 0
    local full_name = 'незивестно:незивестно'
    local block_name = 'незивестно'
    local icon = 'gui/unknown_block'
    if is_item then
        full_name = item.name(picking_item)
        icon = item.icon(picking_item)
    else
        full_name = block.name(id)
    end
    local n = full_name:find(':')
    local mod_name = full_name:sub(0, n - 1)
    if is_item then
        local m = full_name:find('.item')
        block_name = gui.str(full_name:sub(n + 1, m - 1):gsub('_', ' '), mod_name)
    else
        block_name = gui.str(block.caption(id), mod_name)
    end
    document['block_name'].text = block_name
    document['mod_name'].text = mod_name
    document['select_item'].src = icon
end)