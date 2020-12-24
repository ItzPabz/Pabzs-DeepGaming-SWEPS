AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

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

