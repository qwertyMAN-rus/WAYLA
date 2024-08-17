local HUD = require('qWAYLA:viewer_hud')

function on_world_tick()
    local cam = cameras.get("base:first-person")
    local dir = cam:get_front()
    local start = cam:get_pos()
    local max_distance = 10
    local raycast_result = entities.raycast(start, dir, max_distance, player.get_entity())
    if not raycast_result then
        HUD.set_block_UI_visable(false)
        HUD.set_entity_UI_visable(false)
        return
    end
    if raycast_result.entity then
        HUD.set_entity_UI_visable(true)
        HUD.set_block_UI_visable(false)
        local entity = raycast_result.entity
        HUD.set_entity(entity)
    else
        HUD.set_entity_UI_visable(false)
        HUD.set_block_UI_visable(true)
        local id = raycast_result.block
        local x, y, z = unpack(raycast_result.iendpoint)
        HUD.set_block(x, y, z, id)
    end
end