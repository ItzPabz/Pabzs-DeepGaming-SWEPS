include("shared.lua")

net.Receive("open079Menu", function()

    local scp079MenuFrame = vgui.Create( "DFrame" )
    scp079MenuFrame:SetPos( ScrW() / 2 - 75, ScrH() / 2 - 125 ) 
    scp079MenuFrame:SetSize( 250, 205 ) 
    scp079MenuFrame:SetTitle( "Quick Teleport Menu" ) 
    scp079MenuFrame:SetVisible( true ) 
    scp079MenuFrame:SetDraggable( false ) 
    scp079MenuFrame:ShowCloseButton( true ) 
    scp079MenuFrame:MakePopup()


    local rwingButn = vgui.Create( "DButton", scp079MenuFrame ) 
    rwingButn:SetText( "Research Wing" )					
    rwingButn:SetPos( 5, 30 )					
    rwingButn:SetSize( 240, 30 )					
    rwingButn.DoClick = function()	
        scp079MenuFrame:Close()
        net.Start( "set079Pos" )
        net.WriteInt(1,4)
        net.SendToServer()
    end

    local lczButton = vgui.Create( "DButton", scp079MenuFrame ) 
    lczButton:SetText( "LCZ 4 Way" )
    lczButton:SetPos( 5, 65 )					
    lczButton:SetSize( 240, 30 )					
    lczButton.DoClick = function()	
        scp079MenuFrame:Close()
        net.Start( "set079Pos" )
        net.WriteInt(2,4)
        net.SendToServer()
    end

    local hczButton = vgui.Create( "DButton", scp079MenuFrame ) 
    hczButton:SetText( "HCZ 4 Way" )					
    hczButton:SetPos( 5, 100 )					
    hczButton:SetSize( 240, 30 )					
    hczButton.DoClick = function()	
        scp079MenuFrame:Close()
        net.Start( "set079Pos" )
        net.WriteInt(3,4)
        net.SendToServer()
    end

    local lhczButton = vgui.Create( "DButton", scp079MenuFrame ) 
    lhczButton:SetText( "Lower HCZ" )					
    lhczButton:SetPos( 5, 135 )					
    lhczButton:SetSize( 240, 30 )					
    lhczButton.DoClick = function()	
        scp079MenuFrame:Close()
        net.Start( "set079Pos" )
        net.WriteInt(4,4)
        net.SendToServer()
    end

    local uhczButton = vgui.Create( "DButton", scp079MenuFrame ) 
    uhczButton:SetText( "Upper HCZ" )					
    uhczButton:SetPos( 5, 170 )					
    uhczButton:SetSize( 240, 30 )					
    uhczButton.DoClick = function()	
        scp079MenuFrame:Close()
        net.Start( "set079Pos" )
        net.WriteInt(5,4)
        net.SendToServer()
    end

end)