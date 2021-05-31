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