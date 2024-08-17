local BLOCK_UI_ID = 'qWAYLA:viewer_block'
local ENTITY_UI_ID = 'qWAYLA:viewer_entity'
local block_UI_visable = nil
local entity_UI_visable = nil
local block_handler = function(x, y, z, id) end
local entity_handler = function(entity) end
local HUD = {}

function HUD.set_block_UI_visable(new_state)
    if block_UI_visable == new_state then
        return
    end
    block_UI_visable = new_state
    if block_UI_visable then
        hud.open_permanent(BLOCK_UI_ID)
    else
        hud.close(BLOCK_UI_ID)
    end
end

function HUD.set_entity_UI_visable(new_state)
    if entity_UI_visable == new_state then
        return
    end
    entity_UI_visable = new_state
    if entity_UI_visable then
        hud.open_permanent(ENTITY_UI_ID)
    else
        hud.close(ENTITY_UI_ID)
    end
end

function HUD.set_block(x, y, z, id)
    block_handler(x, y, z, id)
end

function HUD.set_entity(entity)
    entity_handler(entity)
end

function HUD.set_block_handler(new_func)
    block_handler = new_func
end

function HUD.set_entity_handler(new_func)
    entity_handler = new_func
end

return HUD