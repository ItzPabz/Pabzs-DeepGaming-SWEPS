AddCSLuaFile()
SWEP.Slot = 3
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true
SWEP.PrintName = "SCP-098 Swep"
SWEP.Author = "ItzPabz"
SWEP.Instructions = [["Left Click: Attack"]]
SWEP.Contact = ""
SWEP.Purpose = ""
resource.AddFile("sound/deep098swep/scp098-crack.mp3")

SWEP.WorldModel = ""
SWEP.ViewModel = ""
SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.UseHands = true
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.HoldType = "knife"
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

function SWEP:Initialize()
    if SERVER then return end
    self:SetHoldType( "knife" )
end

function SWEP:Deploy()
    self:SetHoldType( "knife" )
end

function SWEP:PrimaryAttack()

    local Tr=util.QuickTrace(self.Owner:GetShootPos(), self.Owner:GetAimVector()*70, {self.Owner})
    if ( (Tr.Hit) && (Tr.Entity) &&  (Tr.Entity:IsPlayer()) ) then
        self:SetNextPrimaryFire(CurTime() + DeepGaming098.AttackCooldown)
        self:GetOwner():SetAnimation(5)
        self:GetOwner():EmitSound("deep098swep/scp098-crack.mp3", 35, 155, 1, CHAN_WEAPON)
        if CLIENT then return end
        local dmg098 = DamageInfo()
        dmg098:SetDamagePosition(Tr.HitPos)
        dmg098:SetDamageType(4)
        dmg098:SetDamage( math.random(DeepGaming098.MinDamage, DeepGaming098.MaxDamage) )
        dmg098:SetAttacker(self.Owner)
        dmg098:SetInflictor(self)
        dmg098:SetDamageForce(self.Owner:GetForward() * 85^2) 
        Tr.Entity:TakeDamageInfo(dmg098)
    end

end

function SWEP:OnRemove()

end


local scp089effect = {
    ["$pp_colour_addr"] = 0,
    ["$pp_colour_addg"] = 0,
    ["$pp_colour_addb"] = 0,
    ["$pp_colour_contrast"] = 1,
    ["$pp_colour_colour"] = 0,
}


hook.Add("RenderScreenspaceEffects", "scp098effect", function()
    if ( DeepGaming098.EnableGreyscale == true ) then
        localply = LocalPlayer()
        if localply:IsPlayer() and localply:Alive() and localply:HasWeapon("weapon_deep_098") then
            DrawColorModify( scp089effect )
        end
    end
end )

hook.Add( "PreDrawHalos", "crabSeeCrabEffect", function()
if DeepGaming098.CrabSeeCrab == true then

    localply = LocalPlayer()
    if localply:IsPlayer() and localply:Alive() and localply:HasWeapon("weapon_deep_098") then

        local crabs = {}
        local i = 0
        for _, ply in pairs(player.GetAll()) do
            if ply:Alive() and ( ply:HasWeapon("weapon_deep_098") ) then
                i = i + 1
                crabs[i] = ply
            end
        end
        halo.Add( crabs, Color( 70, 145, 145 ), 2, 2, 1, true, DeepGaming098.CanSeeThroughWall )
    end

end
end )


hook.Add( "PreDrawHalos", "scp098halo", function()
    localply = LocalPlayer()
    if localply:IsPlayer() and localply:Alive() and localply:HasWeapon("weapon_deep_098") then

        local plys = {}
        local i = 0
        for _, ply in pairs( player.GetAll() ) do
            if ply:Alive() and ( ply:Health() < DeepGaming098.HuntHP ) then
                if not DeepGaming098.InvisJobs[ team.GetName( ply:Team() )] then
                    i = i + 1
                    plys[i] = ply
                end
            end
        end
        halo.Add( plys, Color( 255, 0, 0 ), 2, 2, 1, true, DeepGaming098.CanSeeThroughWall )
    end
end )
