include("shared.lua")

function SWEP:Deploy()
    self:SetHoldType( "normal" )
end

local function openMenu()

    if IsValid(pocketMenu) then return end
    scrw = ScrW()
    scrh = ScrH()

    pocketMenu = vgui.Create("DFrame")
    pocketMenu:SetPos(scrw / 2 - 150, scrh / 2 - 75)
    pocketMenu:SetSize(300, 150)
    pocketMenu:SetVisible(true)
    pocketMenu:SetTitle("")
    pocketMenu:SetDraggable(false)
    pocketMenu:ShowCloseButton(false)
    pocketMenu:MakePopup()
    pocketMenu.Paint = function(s,w,h)
        surface.SetDrawColor(Color(0,0,0,225))
        surface.DrawRect(0, 0, w, h)
    end

    local gotoPD = vgui.Create("DButton", pocketMenu)
    gotoPD:SetText( "Travel to Pocket Dimension" )
    gotoPD:SetSize(275, 26)
    gotoPD:SetPos(300 / 2 - 137.5, 150 / 3 - 26)
    gotoPD.DoClick = function()
        LocalPlayer():ChatPrint("You have teleported to your pocket dimension.")
        net.Start("106teleport")
        net.SendToServer()
        pocketMenu:Close()
    end
    gotoPD.Paint = function(s,w,h)
        surface.SetDrawColor(Color(102, 204, 255))
        surface.DrawRect(0, 0, w, h)
        surface.SetTextColor( 0, 0, 0 )
    end

    local leavePD = vgui.Create("DButton", pocketMenu)
    leavePD:SetText( "Leave Pocket Dimension" )
    leavePD:SetSize(275, 26)
    leavePD:SetPos(300 / 2 - 137.5, 150/ 2 - 13 )
    leavePD.DoClick = function()
        LocalPlayer():ChatPrint("You have left your pocket dimension.")
        net.Start("106returntopos")
        net.SendToServer()
        pocketMenu:Close()
    end
    leavePD.Paint = function(s,w,h)
        surface.SetDrawColor(Color(102, 204, 255))
        surface.DrawRect(0, 0, w, h)
        surface.SetTextColor( 0, 0, 0 )
    end


    local closePDmenu = vgui.Create("DButton", pocketMenu)
    closePDmenu:SetText( "CLOSE MENU" )
    closePDmenu:SetSize(176, 26)
    closePDmenu:SetPos(300 / 2 - 88, 150 / 1.5 )
    closePDmenu.DoClick = function()
        pocketMenu:Close()
    end
    closePDmenu.Paint = function(s,w,h)
        surface.SetDrawColor(Color(255,0,0))
        surface.DrawRect(0, 0, w, h)
        surface.SetTextColor( 255, 255, 255 )
    end
end

net.Receive("Deep106.OpenMenu", function()
    openMenu()
end )