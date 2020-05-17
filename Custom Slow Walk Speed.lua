local ref = gui.Reference("RAGEBOT", "ACCURACY", "Movement")
local SLIDER = gui.Slider(ref, "lua_slowwalk_speed_zoom_slider", "Slow Walk Speed While Scoped", 30, 1, 100)
SLIDER:SetDescription("Scale movement speed by this value while scoped.")
local CHECKBOX = gui.Checkbox(ref, "lua_slowwalk_slowwalk_on_scope", "Slow Walk on scope", false)
CHECKBOX:SetDescription("Automatically slow walk on scope.")

local stored = 0
local key
local speed = gui.GetValue( "rbot.accuracy.movement.slowspeed")
local set
local player_local = entities.GetLocalPlayer();
local scoped = player_local:GetProp("m_bIsScoped")

if scoped ~= 0 and scoped ~= 256 then
    set = 1
elseif scoped == 0 or scoped == 256 then
    set = 0
end

callbacks.Register( "Draw", function()
if(entities.GetLocalPlayer() ~= nil and engine.GetServerIP() ~= nil and engine.GetMapName() ~= nil) then

    local player_local = entities.GetLocalPlayer();
    local scoped = player_local:GetProp("m_bIsScoped")

    if CHECKBOX:GetValue() then
        if scoped ~= 0 and scoped ~= 256 then
            if stored == 0 then
                key = gui.GetValue("rbot.accuracy.movement.slowkey")
                stored = 1
            end

            if input.IsButtonDown(65) then -- A
                gui.SetValue("rbot.accuracy.movement.slowkey", 65)
            elseif input.IsButtonDown(68) then -- D
                gui.SetValue("rbot.accuracy.movement.slowkey", 68)
            elseif input.IsButtonDown(87) then -- W
                gui.SetValue("rbot.accuracy.movement.slowkey", 87)
            elseif input.IsButtonDown(83) then -- S
                gui.SetValue("rbot.accuracy.movement.slowkey", 83)    
            end
        else
            if stored == 1 then
                gui.SetValue("rbot.accuracy.movement.slowkey", key)
                stored = 0
            end
        end
    end

    if scoped ~= 0 and scoped ~= 256 then
        if set == 1 then
            speed = gui.GetValue( "rbot.accuracy.movement.slowspeed")
            gui.SetValue( "rbot.accuracy.movement.slowspeed", SLIDER:GetValue() )
            set = 0
        end
    elseif scoped == 0 or scoped == 256 then
        if set == 0 then
            gui.SetValue( "rbot.accuracy.movement.slowspeed", speed )
            set = 1
        end
    end
end
end)