local ref = gui.Reference("RAGEBOT", "ACCURACY", "Movement")
local pistol = gui.Slider(ref, "rbot_accuracy_movement_autostopspeed_pistol", "Pistol Auto Stop Speed", 30, 0, 30)
local heavypistol = gui.Slider(ref, "rbot_accuracy_movement_autostopspeed_heavypistol", "Heavy Pistol Auto Stop Speed", 30, 0, 30)
local submachine = gui.Slider(ref, "rbot_accuracy_movement_autostopspeed_submachineGun", "Submachine Gun Auto Stop Speed", 30, 0, 30)
local rifle = gui.Slider(ref, "rbot_accuracy_movement_autostopspeed_rifle", "Rifle Auto Stop Speed", 30, 0, 30)
local shotgun = gui.Slider(ref, "rbot_accuracy_movement_autostopspeed_shotgun", "Shotgun Auto Stop Speed", 30, 0, 30)
local scout = gui.Slider(ref, "rbot_accuracy_movement_autostopspeed_scout", "Scout Auto Stop Speed", 30, 0, 30)
local autosniper = gui.Slider(ref, "rbot_accuracy_movement_autostopspeed_autosniper", "Autosniper Auto Stop Speed", 30, 0, 30)
local awp = gui.Slider(ref, "rbot_accuracy_movement_autostopspeed_awp", "AWP Auto Stop Speed", 30, 0, 30)
local light = gui.Slider(ref, "rbot_accuracy_movement_autostopspeed_light", "Light Machine Gun Auto Stop Speed", 30, 0, 30)
local zeus = gui.Slider(ref, "rbot_accuracy_movement_autostopspeed_zeus", "Zeus Auto Stop Speed", 30, 0, 30)

local value
local set = 0
local setweapon

local function autostopspeed()
if(entities.GetLocalPlayer() ~= nil and engine.GetServerIP() ~= nil and engine.GetMapName() ~= nil) then
    local activeweapon = entities.GetLocalPlayer():GetPropEntity("m_hActiveWeapon")
    local weapon = activeweapon:GetWeaponType()

    if setweapon ~= tostring(activeweapon) then 
        set = 0
    end

    if set == 0 then
        set = 1
        setweapon = tostring(activeweapon)
        if tostring(activeweapon) == "weapon_taser" then
            value = zeus:GetValue()
            gui.SetValue( "rbot.accuracy.movement.autostopspeed", value )
        elseif weapon == 1 then
        if tostring(activeweapon) == "weapon_revolver" or tostring(activeweapon) == "weapon_deagle" then
            value = heavypistol:GetValue()
            gui.SetValue( "rbot.accuracy.movement.autostopspeed", value )
        else
            value = pistol:GetValue()
            gui.SetValue( "rbot.accuracy.movement.autostopspeed", value )
        end
        elseif weapon == 2 then
            value = submachine:GetValue()
            gui.SetValue( "rbot.accuracy.movement.autostopspeed", value )
        elseif weapon == 3 then
            value = rifle:GetValue()
            gui.SetValue( "rbot.accuracy.movement.autostopspeed", value )
        elseif weapon == 4 then
            value = shotgun:GetValue()
            gui.SetValue( "rbot.accuracy.movement.autostopspeed", value )
        elseif weapon == 5 then
            if tostring(activeweapon) == "weapon_ssg08" then
                value = scout:GetValue()
                gui.SetValue( "rbot.accuracy.movement.autostopspeed", value )
            elseif tostring(activeweapon) == "weapon_awp" then
                value = awp:GetValue()
                gui.SetValue( "rbot.accuracy.movement.autostopspeed", value )
            elseif tostring(activeweapon) == "weapon_g3sg1" or tostring(activeweapon) == "weapon_scar20" then   
                value = autosniper:GetValue()
                gui.SetValue( "rbot.accuracy.movement.autostopspeed", value ) 
            end
        elseif weapon == 6 then 
            value = light:GetValue()
            gui.SetValue( "rbot.accuracy.movement.autostopspeed", value )
        end
    end
end
end
callbacks.Register("Draw", autostopspeed)