SWEP.Slot = 3
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true
SWEP.PrintName = "SCP-372 Swep"
SWEP.Author = "ItzPabz"
SWEP.Instructions = [["LEFT CLICK: KILL + SCAN
RIGHT CLICK: NOCLIP
RELOAD: TRACK/FIND TARGET"]]
SWEP.Contact = ""
SWEP.Purpose = ""

SWEP.WorldModel = ""
SWEP.ViewModel = ""
SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.UseHands = true
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.HoldType = "normal"
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

function SWEP:PrimaryAttack()
    if( !IsFirstTimePredicted() ) then return end
    local _trgt = self.Owner:GetEyeTrace().Entity
    local _ownerPos = self.Owner:GetPos()
    if _trgt == Entity(0) or not _trgt:IsPlayer() then return end
    if _ownerPos:DistToSqr(_trgt:GetPos()) >= 3500 then return end
    if not DeepGaming372.SCPJobs[ team.GetName( _trgt:Team() )] then
        self:SetNextPrimaryFire(CurTime() + DeepGaming372.KillCooldown)
        if SERVER then 
        local dmg = DamageInfo()
        dmg:SetDamagePosition(self.Owner:GetEyeTrace().HitPos)
        dmg:SetDamageType(32)
        dmg:SetDamage(5000)
        dmg:SetAttacker(self.Owner)
        dmg:SetInflictor(self)
        _trgt:TakeDamageInfo(dmg)
        end
        if SERVER then
        local nearestDist, nearestVictim = math.huge
        for _, victims372 in ipairs(player.GetAll()) do
        if not DeepGaming372.SCPJobs[ team.GetName( victims372:Team() )] then
        if self.Owner:GetPos():DistToSqr( victims372:GetPos() ) <= DeepGaming372.MaxVictimDistance^2 then

            if victims372 == self.Owner or victims372:IsDormant() or not victims372:Alive() then continue end

            local dist = victims372:GetPos():DistToSqr(self.Owner:GetPos())
            if dist < nearestDist then
                nearestDist, nearestVictim = dist, victims372
            end

        end
        end
        end
        if nearestVictim then
            local scp372ply = self.Owner
            net.Start("deep372_victim_net")
            net.WriteEntity(nearestVictim)
            net.Send( scp372ply )
        end 
        end
    end
end 

