if DeepGamingChatCMDs.EnableRolls == true then
    net.Receive( "deepRollNET", function( _, ply )
        
        local plyRoller = net.ReadString()
        local plyRollAmnt = net.ReadUInt(7)

        chat.AddText( Color( 255, 0, 0 ), plyRoller, Color( 255, 255, 255 ), " has rolled a ", Color(255, 0, 0), tostring(plyRollAmnt), Color( 255, 255, 255 ), ".")

    end )
end

if DeepGamingChatCMDs.EnableLOOC == true then
    net.Receive( "deepLOOCNET", function( _, ply )
        
        local plyPlayer = net.ReadString()
        local plyMessage = net.ReadString()
        local plyTeamColor = net.ReadColor() 
        
        chat.AddText( plyTeamColor, "(LOOC) ", plyPlayer, Color(255,255,255,255), ":", plyMessage )

    end )
end

