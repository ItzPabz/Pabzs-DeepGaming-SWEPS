AddCSLuaFile()
resource.AddFile("deep966swep/flir-cam-noise.wav")
SWEP.Slot = 3
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true
SWEP.PrintName = "FLIR Camera"
SWEP.Author = "ItzPabz"
SWEP.Instructions = [["Left Click: Attack"]]
SWEP.Contact = ""
SWEP.Purpose = ""

SWEP.WorldModel = "models/maxofs2d/camera.mdl"
SWEP.ViewModel = ""
SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.UseHands = true
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.HoldType = "camera"
SWEP.Category = "Pabz's SCP SWeps"
SWEP.Primary.Delay = 99
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""
SWEP.Secondary.Delay = -1
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""
local activateFlirCam = false

function SWEP:Initialize()
    if SERVER then return end
    self:SetHoldType( "camera" )
end

function SWEP:Deploy()
    self:SetHoldType( "camera" )
end

function SWEP:PrimaryAttack()
    activateFlirCam = true
    self:SetNextPrimaryFire( CurTime() + DeepGaming966.FlirCamDelay)
    self:GetOwner():EmitSound("deep966swep/flir-cam-noise.wav", 30, 100, 1, CHAN_WEAPON)
    timer.Simple(DeepGaming966.ActiveFlirTime, function() 
        activateFlirCam = false
    end)
end


function SWEP:OnRemove()

end


local flircameffect = {
    ["$pp_colour_addr"] = 0,
    ["$pp_colour_addg"] = 0.175,
    ["$pp_colour_addb"] = 0,
    ["$pp_colour_contrast"] = 0.65,
    ["$pp_colour_colour"] = 1
}


hook.Add("RenderScreenspaceEffects", "flirFilter", function()

    if activateFlirCam then

    localply = LocalPlayer()
    if localply:IsPlayer() and localply:Alive() and ( localply:GetActiveWeapon():GetClass() == "weapon_deep_flir" ) then
        DrawColorModify( flircameffect )
    end

    end
end )

hook.Add( "PreDrawHalos", "highlighthostiles", function()
    if activateFlirCam then

    localply = LocalPlayer()
    if localply:IsPlayer() and localply:Alive() and ( localply:GetActiveWeapon():GetClass() == "weapon_deep_flir" ) then

        local victims = {}
        local i = 0
        for _, ply in ipairs(player.GetAll()) do
            if ply:Alive() and ply:HasWeapon( "weapon_deep_966" ) then
                i = i + 1
                victims[i] = ply
            end
        end
        halo.Add( victims, Color( 255, 0, 0 ), 2, 2, 1, true, false )
    end

    end
end )