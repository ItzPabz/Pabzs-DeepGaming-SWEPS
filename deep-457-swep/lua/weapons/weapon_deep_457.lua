AddCSLuaFile()
SWEP.Slot = 3
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false
SWEP.PrintName = "SCP-457 Swep"
SWEP.Author = "ItzPabz"
SWEP.Instructions = ""
SWEP.Contact = ""
SWEP.Purpose = ""

SWEP.WorldModel = ""
SWEP.ViewModel = ""
SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.UseHands = false
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.HoldType = "normal"
SWEP.Category = "Pabz's SCP SWeps"
SWEP.Primary.Delay = 99
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""
SWEP.Secondary.Delay = 99
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

local passivematerial = Material( "materials/scp457-custom/passive.png" ) 
local activematerial = Material( "materials/scp457-custom/onfire.png" )
resource.AddFile( "materials/scp457-custom/passive.png" )
resource.AddFile( "materials/scp457-custom/onfire.png" )


local delay457 = DeepGaming457.HeatWaveCooldown
local nextOccurance457 = 0 
local current457EffectStatus = 0

local function spec457Ability(wep, playerself)

    
    local timeLeft457 = nextOccurance457 - CurTime()
    if timeLeft457 < 0 then
    current457EffectStatus = 0
    if !SERVER then return end
        for _, ply in ipairs(player.GetAll()) do
            if  playerself:GetPos():DistToSqr(ply:GetPos() ) <= DeepGaming457.BurnDistance^2 then
                if not DeepGaming457.ImmuneJobs[ team.GetName( ply:Team() )] then
                    if ply != playerself then
                    local boomSpec457 = DamageInfo()
                    boomSpec457:SetDamageType(67108864)
                    boomSpec457:SetDamage( DeepGaming457.BoomDamage )
                    boomSpec457:SetAttacker(playerself)
                    boomSpec457:SetInflictor(wep)
                    ply:TakeDamageInfo(boomSpec457)
                    ply:Freeze( true )
                    if current457EffectStatus == 0 then ply:Ignite(0.5) end
                    timer.Simple(DeepGaming457.StunnedTime, function()  ply:Freeze( false ) end)
                    end
                else continue end
            end
        end
                
                wep:SetNextPrimaryFire( CurTime() + DeepGaming457.SetNextBurn )
                playerself:EmitSound("deep457swep/457boom.mp3", 66, 100, 1, 1)
                nextOccurance457 = CurTime() + delay457
    end
            
end


function SWEP:Deploy()
    self:SetHoldType( "normal" )

    current457EffectStatus = 0
    self:GetOwner():SetModelScale( DeepGaming457.StartingSize, 0 )

    if SERVER then
        self:GetOwner():GodEnable()
    end
end

function SWEP:PrimaryAttack()
    current457EffectStatus = 1
    self.Owner:SetModelScale( DeepGaming457.MaxSize, 35 )

end

function SWEP:SecondaryAttack()
    current457EffectStatus = 0
    self:GetOwner():SetModelScale( DeepGaming457.StartingSize, 25 )

end 

if DeepGaming457.EnableHeatWave == true then
function SWEP:Reload()
    spec457Ability(self, self:GetOwner())
end
end


function SWEP:Think()
if CLIENT then return end
    if ( current457EffectStatus == 1 ) then
        for _, ply in ipairs(player.GetAll()) do
            if  self:GetOwner():GetPos():DistToSqr(ply:GetPos() ) <= DeepGaming457.BurnDistance^2 then
                if not DeepGaming457.ImmuneJobs[ team.GetName( ply:Team() )] then
                    ply:Ignite( DeepGaming457.BurnTime )
                else continue end
            end
        end
    end
end


function SWEP:DrawHUD()
    surface.SetDrawColor( 255, 255, 255, 255 )
    if current457EffectStatus == 1 then
        surface.SetMaterial( activematerial )
    end
    if current457EffectStatus == 0 then
        surface.SetMaterial( passivematerial ) 
    end
    surface.DrawTexturedRect( ScrW()/2 - 110, ScrH()/1.5, 160, 160 )
end



hook.Add( "ExtinguisherDoExtinguish", "scp457BeGone", function( ply )
    if ply:IsPlayer() and ply:Alive() and ply:HasWeapon("weapon_deep_457") then 
        ply:Extinguish()
        current457EffectStatus = 0
    end
return true end )


if CLIENT then
    function SWEP:OnRemove()
    current457EffectStatus = 0
    end
end

if SERVER then 
    function SWEP:OnRemove()
    self:GetOwner():GodDisable()
    end
end