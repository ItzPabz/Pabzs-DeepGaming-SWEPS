if DeepGamingChatCMDs.EnableRolls == true then
net.Receive( "deepRollNET", function( _, ply )
	
    local plyRoller = net.ReadString()
    local plyRollAmnt = net.ReadUInt(7)
    print(plyRollAmnt)

    chat.AddText( Color( 255, 0, 0 ), plyRoller, Color( 255, 255, 255 ), " has rolled a ", Color(255, 0, 0), tostring(plyRollAmnt), Color( 255, 255, 255 ), ".")

end )
end