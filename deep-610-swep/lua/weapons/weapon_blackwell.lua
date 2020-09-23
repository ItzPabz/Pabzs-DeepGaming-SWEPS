AddCSLuaFile()
SWEP.Slot = 3
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true
SWEP.PrintName = "Blackwell Mode"
SWEP.Author = "ItzPabz"
SWEP.Instructions = [["Left Click: Attack"]]
SWEP.Contact = ""
SWEP.Purpose = ""
SWEP.WorldModel = ""
SWEP.ViewModel = ""
SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.UseHands = true
SWEP.Spawnable = false
SWEP.AdminOnly = true

SWEP.HoldType = "normal"
SWEP.Category = "Other"
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
SWEP.ShootSound = Sound( "Metal.SawbladeStick" )
 
function SWEP:PrimaryAttack()
    self:SetHoldType("normal")
	self:SetNextPrimaryFire( CurTime() + 0.5 )	
	self:ThrowChair( "models/props/cs_office/Chair_office.mdl" )
	self:GetOwner():EmitSound("damien_japwell/fuck-you.mp3", 35, 100, 1, CHAN_WEAPON)
end
 

function SWEP:SecondaryAttack()
	self:SetNextSecondaryFire( CurTime() + 0.1 )
	self:ThrowChair( "models/props_c17/FurnitureChair001a.mdl" )
	self:GetOwner():EmitSound("damien_japwell/fuck-off.mp3", 35, 100, 1, CHAN_WEAPON)
end

function SWEP:ThrowChair( model_file )
	local owner = self:GetOwner()
	if ( not owner:IsValid() ) then return end
	if ( CLIENT ) then return end
	local ent = ents.Create( "prop_physics" )
	if ( not ent:IsValid() ) then return end
	ent:SetModel( model_file )
	local aimvec = owner:GetAimVector()
	local pos = aimvec * 16 
	pos:Add( owner:EyePos() ) 
	ent:SetPos( pos )
	ent:SetAngles( owner:EyeAngles() )
	ent:Spawn()
	local phys = ent:GetPhysicsObject()
	if ( not phys:IsValid() ) then ent:Remove() return end
	aimvec:Mul( 100 )
	aimvec:Add( VectorRand( -10, 10 ) ) 
	phys:ApplyForceCenter( aimvec )
	cleanup.Add( owner, "props", ent )
	undo.Create( "Thrown_Chair" )
		undo.AddEntity( ent )
		undo.SetPlayer( owner )
	undo.Finish()
end