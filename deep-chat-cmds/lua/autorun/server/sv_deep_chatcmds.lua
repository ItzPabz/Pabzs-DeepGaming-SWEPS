if DeepGamingChatCMDs.EnableRolls == true then
util.AddNetworkString("deepRollNET")

hook.Add("PlayerSay", "deepRollCommand", function( ply, text )
	if DeepGamingChatCMDs.RollCommands[string.lower(text)] then

        local rndNumRoll = math.random(0,100)

        print(ply:Nick() .. " has rolled a " .. rndNumRoll)

		for _, msgPly in ipairs(player.GetAll()) do
            if ply:GetPos():DistToSqr( msgPly:GetPos() ) <= DeepGamingChatCMDs.RollChatDistance^2 then
                net.Start("deepRollNET")
                net.WriteString(ply:Nick())
                net.WriteUInt(rndNumRoll, 7)
                net.Send( msgPly )
            end
        end

        return ""

	end
end)
end


if DeepGamingChatCMDs.EnableLOOC == true then
util.AddNetworkString("deepLOOCNET")

hook.Add("PlayerSay", "deepLOOCCommand", function( ply, text )
    if DeepGamingChatCMDs.LOOCCommand[ string.sub( string.lower(text), 1, 5 ) ] then

        print( "(LOOC) " .. ply:Nick() .. ":" .. string.sub(text, 6 , 99) )

        for _, loocmsgPlys in ipairs( player.GetAll() ) do
            if ply:GetPos():DistToSqr( loocmsgPlys:GetPos() ) <= DeepGamingChatCMDs.LOOCDistance^2 then
                net.Start("deepLOOCNET")
                net.WriteString( ply:Nick() )
                net.WriteString( string.sub(text, 6 , 99) )
                net.WriteColor( team.GetColor( ply:Team() ) )
                net.Send( loocmsgPlys )
            end
        end

        return ""

    end
end)
end
