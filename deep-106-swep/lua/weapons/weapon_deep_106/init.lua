AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")


function SWEP:Deploy()
    self.Owner:SetCustomCollisionCheck( true )
    self.Owner:SetWalkSpeed( DeepGaming106.WalkSpeed )
    self.Owner:SetRunSpeed( DeepGaming106.RunSpeed )
end

function SWEP:OnRemove()
    self.Owner:SetCustomCollisionCheck( false )
    oldPosition106 = nil
end

function SWEP:OnDrop()
    self:OnRemove()
    self:Remove()
    self.Owner:SetCustomCollisionCheck( false )
end

function SWEP:Holster()
    self:OnRemove()
    return true
end

function SWEP:Reload()
    if( !IsFirstTimePredicted() ) then return end

    net.Start("Deep106.OpenMenu")
    net.Send(self.Owner)
end

function SWEP:Equip()
    self:SetHoldType( "normal" )
    self.Owner:SetWalkSpeed( DeepGaming106.WalkSpeed )
    self.Owner:SetRunSpeed( DeepGaming106.RunSpeed )
end

hook.Add( "ShouldCollide", "Custom106Collision", function( entity1, entity2 )

    if ( entity1:IsPlayer() ) then
    if ( entity1:GetActiveWeapon():GetClass() == "weapon_deep_106" ) then
    if DeepGaming106.BlockedEntityIndexes[entity2:EntIndex()] then return true end
    if ( entity2:GetClass() == "func_brush") then return true end
    return false end end
end )

