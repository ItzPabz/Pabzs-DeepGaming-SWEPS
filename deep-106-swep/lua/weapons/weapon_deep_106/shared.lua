SWEP.Slot = 3
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true
SWEP.PrintName = "SCP-106 Swep"
SWEP.Author = "ItzPabz"
SWEP.Instructions = [[""]]
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
    if _trgt == "Entity [0][worldspawn]" or not _trgt:IsPlayer() then return end
    if _ownerPos:DistToSqr(_trgt:GetPos()) >= 3500 then return end
    if not DeepGaming106.SCPJobs[ team.GetName( _trgt:Team() )] then
        self.Owner:SetCustomCollisionCheck( true )
        self:EmitSound("deep106swep/laugh.mp3", 55, 100, 1, CHAN_WEAPON)
        local ent = _trgt
        local pos = ent:GetPos()
        local target = pos - Vector(0,0,100)
        timer.Create("106succ",0.1,0, function()
            pos = Lerp(0.05, pos, target) ent:SetPos(pos) 
        end)
        self:SetNextPrimaryFire(CurTime() + DeepGaming106.PocketCooldown)
        timer.Create("endsucc", 4, 1, function()
            timer.Destroy("106succ")
            local data = file.Read("scpsweps/106pos.txt")
            data = string.Explode(";", data)
            if data == nil then
                local dmg = DamageInfo()
                dmg:SetDamagePosition(Tr.HitPos)
                dmg:SetDamageType(1048576)
                dmg:SetDamage(1000)
                dmg:SetAttacker(self.Owner)
                dmg:SetInflictor(self)
                ent:TakeDamageInfo(dmg)
            else
                ent:SetPos( Vector(tonumber(data[1]),tonumber(data[2]),tonumber(data[3])) )
            end
        end)
    end
end

function SWEP:SecondaryAttack()
    if( !IsFirstTimePredicted() ) then return end
    local _trgt = self.Owner:GetEyeTrace().Entity
    local _ownerPos = self.Owner:GetPos()
    if _trgt == Entity(0) or not _trgt:IsPlayer() then return end
    if _ownerPos:DistToSqr(_trgt:GetPos()) >= 3500 then return end
    self:EmitSound("deep106swep/breathing.mp3", 55, 100, 1, CHAN_WEAPON)
    if not DeepGaming106.SCPJobs[ team.GetName( _trgt:Team() )] then
        self:SetNextSecondaryFire(CurTime() + DeepGaming106.KillCooldown)
        if SERVER then 
        local dmg = DamageInfo()
        dmg:SetDamagePosition(self.Owner:GetEyeTrace().HitPos)
        dmg:SetDamageType(1048576)
        dmg:SetDamage(1000)
        dmg:SetAttacker(self.Owner)
        dmg:SetInflictor(self)
        _trgt:TakeDamageInfo(dmg)
        end
    end
end 


--- This shit dont work, u can uncomment but the sound wont work, will fix later. - Pabz
--[[
function SWEP:Think()
    local current106Velocity = self.Owner:GetVelocity()
    if not current106Velocity:IsZero() then 
        self:EmitSound("deep106swep/breathing.mp3", 55, 100, 1, CHAN_WEAPON)
    end
end
]]