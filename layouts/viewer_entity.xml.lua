local HUD = require('qWAYLA:viewer_hud')

HUD.set_entity_handler(function(entity_id)
    local component = entities.get(entity_id)
    local full_name = component:def_name()
    local n = full_name:find(':')
    local mod_name = full_name:sub(0, n - 1)
    local block_name = gui.str(full_name:sub(n + 1, -1):gsub('_', ' '), mod_name)
    document['entity_name'].text = block_name
    document['mod_name'].text = mod_name
end)