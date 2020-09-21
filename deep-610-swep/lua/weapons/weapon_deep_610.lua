AddCSLuaFile()
SWEP.Slot = 3
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true
SWEP.PrintName = "SCP-610 Swep"
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

function scp610Menu()
    local ply = LocalPlayer()

    local logisticsPNG =        Material( "materials/scp610logos/resurrection.png" )
    local bloodthristyPNG =     Material( "materials/scp610logos/bloodsucker.png" )
    local misdirectionPNG =     Material( "materials/scp610logos/deceit.png" )

    local scp610frame = vgui.Create( "DFrame" )
    scp610frame:SetPos( ScrW() / 2 - 220, ScrH() / 2 - 75) 
    scp610frame:SetSize( 440, 150 ) 
    scp610frame:SetTitle( "" ) 
    scp610frame:SetVisible( true ) 
    scp610frame:SetDraggable( false ) 
    scp610frame:ShowCloseButton( false ) 
    scp610frame:MakePopup()
    scp610frame.Paint = function( self, w, h )
        draw.RoundedBox( 0, 0, 0, w, h, Color( 25, 25, 25, 245 ) ) -- Draw a blue button
    end

    local logisticBttn = vgui.Create( "DButton", scp610frame ) 
    logisticBttn:SetText( "" )
    logisticBttn:SetPos( 5, 5 )
    logisticBttn:SetSize( 140, 140 )	
    logisticBttn.DoClick = function()
        scp610frame:Close()
        scp610type = 1
        if DeepGaming610.EnableDifferentModels then
            net.Start( "get610Model" )
            net.WriteInt(1, 4)
            net.SendToServer()
        end
        chat.AddText( Color( 255, 255, 0 ), "You have chosen ", Color( 255, 0, 0 ), "RESURRECTION", 
        Color( 255, 255, 0 ), "! This ability revives any human you've killed a a zombie to help you!")
    end
    logisticBttn.Paint = function( self, w, h )
        surface.SetDrawColor( 255, 255, 255, 255 )
        surface.SetMaterial( logisticsPNG )
        surface.DrawTexturedRect( 0, 0, 140, 140 )
    end

    local bloodthristyBttn = vgui.Create( "DButton", scp610frame ) 
    bloodthristyBttn:SetText( "" )
    bloodthristyBttn:SetPos( 150, 5 )
    bloodthristyBttn:SetSize( 140, 140 )	
    bloodthristyBttn.DoClick = function()
        scp610frame:Close()
        scp610type = 2
        if DeepGaming610.EnableDifferentModels then
            net.Start( "get610Model" )
            net.WriteInt(2, 4)
            net.SendToServer()
        end
        chat.AddText( Color( 255, 255, 0 ), "You have chosen ", Color( 255, 0, 0 ), "BLOODSUCKER", 
        Color( 255, 255, 0 ), "! This ability heals you as you hurt people, like a vampire!")
    end
    bloodthristyBttn.Paint = function( self, w, h )
        surface.SetDrawColor( 255, 255, 255, 255 )
        surface.SetMaterial( bloodthristyPNG )
        surface.DrawTexturedRect( 0, 0, 140, 140 )
    end

    local misdirectionBttn = vgui.Create( "DButton", scp610frame ) 
    misdirectionBttn:SetText( "" )
    misdirectionBttn:SetPos( 295, 5 )
    misdirectionBttn:SetSize( 140, 140 )	
    misdirectionBttn.DoClick = function()
        scp610frame:Close()
        scp610type = 3
        if DeepGaming610.EnableDifferentModels then
            net.Start( "get610Model" )
            net.WriteInt(3, 4)
            net.SendToServer()
        end
        chat.AddText( Color( 255, 255, 0 ), "You have chosen ", Color( 255, 0, 0 ), "DECEIT", 
        Color( 255, 255, 0 ), "! This ability disguises yourself as the last person you've killed!")
    end
    misdirectionBttn.Paint = function( self, w, h )
        surface.SetDrawColor( 255, 255, 255, 255 )
        surface.SetMaterial( misdirectionPNG )
        surface.DrawTexturedRect( 0, 0, 140, 140 )
    end
end

function SWEP:Initialize()
    if SERVER then return end
    self:SetHoldType( "knife" )
    scp610Menu()
end


function SWEP:Deploy()

end

function SWEP:PrimaryAttack()

end

function SWEP:SecondaryAttack()

end

function SWEP:Think()

end

function SWEP:OnRemove()

end
