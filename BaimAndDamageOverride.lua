local guiSet = gui.SetValue
local guiGet = gui.GetValue
local b_toggle = input.IsButtonDown
local rage_ref_extra = gui.Reference("RAGEBOT", "AIMBOT", "AUTOMATION");
local chengeDamageText = gui.Text(rage_ref_extra, "--- Changer Damage ---");
local newDamage = gui.Slider(rage_ref_extra, "NewDamage", "Min damage", 1, 0, 100);
local changeKey = gui.Keybox(rage_ref_extra, "ChangeDmgKey", "Change damage key", 0);
local baimcheck = gui.Checkbox( rage_ref_extra, "BaimCheck", "Turn on baim priority", 1 )
local firstTime = 1;
local auto = guiGet("rbot.accuracy.weapon.asniper.mindmg")
local sniper = guiGet("rbot.accuracy.weapon.sniper.mindmg")
local pistol = guiGet("rbot.accuracy.weapon.pistol.mindmg")
local revolver = guiGet("rbot.accuracy.weapon.hpistol.mindmg")
local smg = guiGet("rbot.accuracy.weapon.smg.mindmg")
local rifle = guiGet("rbot.accuracy.weapon.rifle.mindmg")
local shotgun = guiGet("rbot.accuracy.weapon.shotgun.mindmg")
local scout = guiGet("rbot.accuracy.weapon.scout.mindmg")
local lmg = guiGet("rbot.accuracy.weapon.lmg.mindmg")

local bauto = guiGet("rbot.hitscan.mode.asniper.bodyaim")
local bsniper = guiGet("rbot.hitscan.mode.sniper.bodyaim")
local bpistol = guiGet("rbot.hitscan.mode.pistol.bodyaim")
local brevolver = guiGet("rbot.hitscan.mode.hpistol.bodyaim")
local bsmg = guiGet("rbot.hitscan.mode.smg.bodyaim")
local brifle = guiGet("rbot.hitscan.mode.rifle.bodyaim")
local bshotgun = guiGet("rbot.hitscan.mode.shotgun.bodyaim")
local bscout = guiGet("rbot.hitscan.mode.scout.bodyaim")
local blmg = guiGet("rbot.hitscan.mode.lmg.bodyaim")

function changeDmgMain()

    if (changeKey:GetValue() == 0) then
        return -1;
    end
    if (input.IsButtonPressed(changeKey:GetValue())) then
        if (firstTime == 1) then
            auto = guiGet("rbot.accuracy.weapon.asniper.mindmg")
            sniper = guiGet("rbot.accuracy.weapon.sniper.mindmg")
            pistol = guiGet("rbot.accuracy.weapon.pistol.mindmg")
            revolver = guiGet("rbot.accuracy.weapon.hpistol.mindmg")
            smg = guiGet("rbot.accuracy.weapon.smg.mindmg")
            rifle = guiGet("rbot.accuracy.weapon.rifle.mindmg")
            shotgun = guiGet("rbot.accuracy.weapon.shotgun.mindmg")
            scout = guiGet("rbot.accuracy.weapon.scout.mindmg")
            lmg = guiGet("rbot.accuracy.weapon.lmg.mindmg")

            guiSet("rbot.accuracy.weapon.asniper.mindmg", math.floor(newDamage:GetValue()))
            guiSet("rbot.accuracy.weapon.sniper.mindmg", math.floor(newDamage:GetValue()))
            guiSet("rbot.accuracy.weapon.pistol.mindmg", math.floor(newDamage:GetValue()))
            guiSet("rbot.accuracy.weapon.hpistol.mindmg", math.floor(newDamage:GetValue()))
            guiSet("rbot.accuracy.weapon.smg.mindmg", math.floor(newDamage:GetValue()))
            guiSet("rbot.accuracy.weapon.rifle.mindmg", math.floor(newDamage:GetValue()))
            guiSet("rbot.accuracy.weapon.shotgun.mindmg", math.floor(newDamage:GetValue()))
            guiSet("rbot.accuracy.weapon.scout.mindmg", math.floor(newDamage:GetValue()))
            guiSet("rbot.accuracy.weapon.lmg.mindmg", math.floor(newDamage:GetValue()))

            if baimcheck:GetValue() then
            bauto = guiGet("rbot.hitscan.mode.asniper.bodyaim")
            bsniper = guiGet("rbot.hitscan.mode.sniper.bodyaim")
            bpistol = guiGet("rbot.hitscan.mode.pistol.bodyaim")
            brevolver = guiGet("rbot.hitscan.mode.hpistol.bodyaim")
            bsmg = guiGet("rbot.hitscan.mode.smg.bodyaim")
            brifle = guiGet("rbot.hitscan.mode.rifle.bodyaim")
            bshotgun = guiGet("rbot.hitscan.mode.shotgun.bodyaim")
            bscout = guiGet("rbot.hitscan.mode.scout.bodyaim")
            blmg = guiGet("rbot.hitscan.mode.lmg.bodyaim")

            guiSet("rbot.hitscan.mode.asniper.bodyaim", 1)
            guiSet("rbot.hitscan.mode.sniper.bodyaim", 1)
            guiSet("rbot.hitscan.mode.pistol.bodyaim", 1)
            guiSet("rbot.hitscan.mode.hpistol.bodyaim", 1)
            guiSet("rbot.hitscan.mode.smg.bodyaim", 1)
            guiSet("rbot.hitscan.mode.rifle.bodyaim", 1)
            guiSet("rbot.hitscan.mode.shotgun.bodyaim", 1)
            guiSet("rbot.hitscan.mode.scout.bodyaim", 1)
            guiSet("rbot.hitscan.mode.lmg.bodyaim", 1)
            end

            firstTime = 0
        end
    elseif (b_toggle(changeKey:GetValue())) then
        -- do nothing ;)
    elseif (input.IsButtonReleased(changeKey:GetValue())) then
        guiSet("rbot.accuracy.weapon.asniper.mindmg", auto)
        guiSet("rbot.accuracy.weapon.sniper.mindmg", sniper)
        guiSet("rbot.accuracy.weapon.pistol.mindmg", pistol)
        guiSet("rbot.accuracy.weapon.hpistol.mindmg", revolver)
        guiSet("rbot.accuracy.weapon.smg.mindmg", smg)
        guiSet("rbot.accuracy.weapon.rifle.mindmg", rifle)
        guiSet("rbot.accuracy.weapon.shotgun.mindmg", shotgun)
        guiSet("rbot.accuracy.weapon.scout.mindmg", scout)
        guiSet("rbot.accuracy.weapon.lmg.mindmg", lmg)

        if baimcheck:GetValue() then
        guiSet("rbot.hitscan.mode.asniper.bodyaim", bauto)
        guiSet("rbot.hitscan.mode.sniper.bodyaim", bsniper)
        guiSet("rbot.hitscan.mode.pistol.bodyaim", bpistol)
        guiSet("rbot.hitscan.mode.hpistol.bodyaim", brevolver)
        guiSet("rbot.hitscan.mode.smg.bodyaim", bsmg)
        guiSet("rbot.hitscan.mode.rifle.bodyaim", brifle)
        guiSet("rbot.hitscan.mode.shotgun.bodyaim", bshotgun)
        guiSet("rbot.hitscan.mode.scout.bodyaim", bscout)
        guiSet("rbot.hitscan.mode.lmg.bodyaim", blmg)
        end

        firstTime = 1;
    end
end
callbacks.Register("Draw", "changeDmgMain", changeDmgMain);