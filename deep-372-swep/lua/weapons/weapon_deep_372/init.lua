AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
util.AddNetworkString("deep372_victim_net")

local shouldOccur = true
function SWEP:Reload()
if !IsFirstTimePredicted() then return end
if shouldOccur then
    shouldOccur = false
    timer.Simple( DeepGaming372.ScanCooldown, function() shouldOccur = true end )
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


else return end
end

function SWEP:SecondaryAttack()
    self:SetNextSecondaryFire( CurTime() + 2 )
    local curMovType = self.Owner:GetMoveType() 
    if curMovType == 2 then 
        self.Owner:SetMoveType(8)
    else 
        self.Owner:SetMoveType(2)
    end
end



function SWEP:Think()

    local scp372ply = self.Owner
    if self.Owner:GetActiveWeapon():GetClass() ~= "weapon_deep_372" then return end

        if scp372ply:GetNoDraw() == false then
            timer.Simple(DeepGaming372.FlickerTime, function()
                scp372ply:SetNoDraw(true)
                scp372ply:DrawShadow(false)
            end)
            timer.Simple(DeepGaming372.InvisTime, function()
                scp372ply:SetNoDraw(false)
                scp372ply:DrawShadow(true)
            end)
        else return end

end
