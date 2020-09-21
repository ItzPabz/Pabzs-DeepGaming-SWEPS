AddCSLuaFile()
SWEP.Slot = 3
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true
SWEP.PrintName = "SCP-610 Swep"
SWEP.Author = "ItzPabz"
SWEP.Instructions = [["Left Click: Attack"]] -- a string within a string, odd way of doing things
SWEP.Contact = ""
SWEP.Purpose = ""

SWEP.WorldModel = ""
SWEP.ViewModel = ""
SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.UseHands = true
SWEP.Spawnable = false
SWEP.AdminOnly = true

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

end

function SWEP:PrimaryAttack()

    local Tr=util.QuickTrace(self.Owner:GetShootPos(), self.Owner:GetAimVector()*70, {self.Owner})
    if ( (Tr.Hit) && (Tr.Entity) &&  (Tr.Entity:IsPlayer()) ) then
    if not DeepGaming610.ImmuneJobs[ team.GetName( Tr.Entity:Team() )] then
        self:GetOwner():EmitSound("Weapon_Crossbow.BoltHitBody", 35, 155, 1, CHAN_WEAPON)
        self:SetNextPrimaryFire(CurTime() + DeepGaming610.AttackCooldown)
        self:GetOwner():SetAnimation(5)
        if CLIENT then return end
        local dmg6101 = DamageInfo()
        dmg6101:SetDamagePosition(Tr.HitPos)
        dmg6101:SetDamageType(4)
        dmg6101:SetDamage( math.random(DeepGaming610.MinDamage, DeepGaming610.MaxDamage) )
        dmg6101:SetAttacker(self.Owner)
        dmg6101:SetInflictor(self)
        dmg6101:SetDamageForce(self.Owner:GetForward() * 85^2) 
        Tr.Entity:TakeDamageInfo(dmg6101)
    end
    end

end

function SWEP:SecondaryAttack()

end

function SWEP:Think()

end

function SWEP:OnRemove()

end

