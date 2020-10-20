AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
util.AddNetworkString("open079Menu")

function SWEP:Initialize()
    timer.Simple(0, function()
        if DeepGaming079.DonorUserGroups[ self.Owner:GetUserGroup() ] then
            self.GuthSCPLVL = 5
        end 
        end)
        self:SetHoldType("normal")
        self.Cooldown = CurTime() 
   
end

function SWEP:PrimaryAttack()
    self:SetNextPrimaryFire( CurTime() + DeepGaming079.LockDoorCD )
    for k, v in ipairs( ents.FindByClass( "func_door" ) ) do
        if self.Owner:GetPos():DistToSqr( v:GetPos() ) <=  DeepGaming079.DoorDistance^2 then
            v:Fire("Lock")
            if DeepGaming079.DoDoorsForceClose then v:Fire("Close") end
            timer.Simple(DeepGaming079.LockTime, function()
                v:Fire("Unlock")
                if DeepGaming079.DoDoorsForceOpen then v:Fire("Open") end
            end)
        end
    end
end

function SWEP:SecondaryAttack()
    self:SetNextPrimaryFire( CurTime() + 2 )
    local curMovType = self.Owner:GetMoveType() 
    if curMovType == 2 then 
        self.Owner:SetMoveType(8)
    else 
        self.Owner:SetMoveType(2)
    end
end


function SWEP:Reload()
if CurTime() < self.Cooldown then return end
self.Cooldown = CurTime() + DeepGaming079.TeleportCooldown
    net.Start("open079Menu")
    net.Send(self.Owner)
end
