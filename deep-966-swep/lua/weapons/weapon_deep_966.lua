AddCSLuaFile()
resource.AddFile("deep966swep/scp9661.wav")
resource.AddFile("deep966swep/scp9662.wav")
resource.AddFile("deep966swep/scp9663.wav")
resource.AddFile("deep966swep/scp9664.wav")
resource.AddFile("deep966swep/scp9665.wav")
SWEP.Slot = 3
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true
SWEP.PrintName = "SCP-966 Swep"
SWEP.Author = "ItzPabz"
SWEP.Instructions = [["Left Click: Attack"]]
SWEP.Contact = ""
SWEP.Purpose = ""

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
SWEP.AccurateCrosshair = true

if CLIENT then
surface.CreateFont( "bigboi", {
    font = "Arial", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
    extended = false,
    size = 35,
    weight = 500,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    outline = true,
})
end


function SWEP:Initialize()
	self:SetWeaponHoldType("normal")
end

function SWEP:PrimaryAttack()
	local Tr=util.QuickTrace(self.Owner:GetShootPos(), self.Owner:GetAimVector()*70, {self.Owner})
    if ( (Tr.Hit) && (Tr.Entity) &&  (Tr.Entity:IsPlayer()) ) then
        self:SetNextPrimaryFire(CurTime() + DeepGaming966.AttackCooldown)
        self:GetOwner():SetAnimation(5)

        if CLIENT then return end

        local dmg966 = DamageInfo()
        dmg966:SetDamagePosition(Tr.HitPos)
        dmg966:SetDamageType(4)
        dmg966:SetDamage( math.random(DeepGaming966.MinDamage, DeepGaming966.MaxDamage) )
        dmg966:SetAttacker(self.Owner)
        dmg966:SetInflictor(self)
        dmg966:SetDamageForce(self.Owner:GetForward() * 65^2) 
        Tr.Entity:TakeDamageInfo(dmg966)
    end

end


function SWEP:SecondaryAttack()

    local ply = self:GetOwner()
    
    	if ply:GetNoDraw() == false then
    		ply:SetNoDraw(true)
        	ply:DrawShadow(false)
	    	else
			ply:SetNoDraw(false)
	        ply:DrawShadow(true)
    	end
end

hook.Add("HUDPaint", "invisswep.paint", function()
if not IsValid(LocalPlayer():GetActiveWeapon()) then return end
if LocalPlayer():GetActiveWeapon():GetClass() ~= "weapon_deep_966" or not LocalPlayer():GetNoDraw() then return end
    draw.SimpleText( "You are Now Invisible", "bigboi", ScrW()/2, ScrH()/1.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end)

function SWEP:OnRemove()
    if SERVER && IsValid(self.Owner) then
        self.Owner:SetNoDraw(false)
        self.Owner:DrawShadow(true)
    end
end

function SWEP:OnDrop()
    if SERVER && IsValid(self.Owner) then
        self.Owner:SetNoDraw(false)
        self.Owner:DrawShadow(true)
    end
end

function SWEP:DrawWorldModel()
	self:DestroyShadow(true)
end

function SWEP:Think()
    if self:GetOwner():IsOnFire() then
        self:GetOwner():Extinguish()
    end
end


local noiseDelay = DeepGaming966.TauntDelay
local tauntLastTime = -noiseDelay

function SWEP:Reload()
    local time966Elapsed = CurTime() - tauntLastTime
    if time966Elapsed < noiseDelay then 
        return 
    else
    self:GetOwner():EmitSound("deep966swep/scp966" .. math.random(1,5) .. ".wav", 60, 100, 1, CHAN_WEAPON)
    if self:GetOwner():Health() < DeepGaming966.MaxHealed then
    timer.Simple(8, function()
        self:GetOwner():SetHealth( self:GetOwner():Health() + math.random(DeepGaming966.MinHealthAmnt, DeepGaming966.MaxHealthAmnt) )
    end)
    end
        tauntLastTime = CurTime()
    end
end


hook.Add( "PreDrawHalos", "scp966see966", function()
if DeepGaming966.HighlightTeam == true then

    localply = LocalPlayer()
    if localply:IsPlayer() and localply:Alive() and localply:HasWeapon("weapon_deep_966") then

        local scp966s = {}
        local i = 0
        for _, ply in pairs(player.GetAll()) do
            if ply:Alive() and ( ply:HasWeapon("weapon_deep_966") ) then
                i = i + 1
                scp966s[i] = ply
            end
        end
        halo.Add( scp966s, Color( 0, 255, 0 ), 2, 2, 1, true, DeepGaming966.HighlightTeamThroughWall )
    end

end
end )


hook.Add( "PreDrawHalos", "scp966seeFLIR", function()
if DeepGaming966.SenseFLIR == true then

    localply = LocalPlayer()
    if localply:IsPlayer() and localply:Alive() and localply:HasWeapon("weapon_deep_966") then

        local flirEnms = {}
        local i = 0
        for _, ply in pairs(player.GetAll()) do
            if ply:Alive() and ply:GetActiveWeapon() == "weapon_deep_flir" then
                i = i + 1
                flirEnms[i] = ply
            end
        end
        halo.Add( flirEnms, Color( 255, 0, 0 ), 2, 2, 1, true, true )
    end

end
end )