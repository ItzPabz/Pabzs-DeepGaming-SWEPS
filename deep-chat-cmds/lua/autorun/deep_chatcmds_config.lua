AddCSLuaFile()
DeepGamingChatCMDs = DeepGamingChatCMDs or {}

--[[---------------------------------
--  _____              __ _        --
-- /  __ \            / _(_)       --
-- | /  \/ ___  _ __ | |_ _  __ _  --
-- | |    / _ \| '_ \|  _| |/ _` | --
-- | \__/\ (_) | | | | | | | (_| | --
--  \____/\___/|_| |_|_| |_|\__, | --
--                           __/ | --
--                          |___/  --
--]]---------------------------------

DeepGamingChatCMDs.EnableLOOC = true -- Enables the /looc feature
DeepGamingChatCMDs.LOOCDistance = 500 -- The distance from the player rolling, that other players can see the roll results. 
DeepGamingChatCMDs.LOOCCommandLength = 5 -- The length of the looc command. ( "/looc" has 5 characters so set it to 5)

DeepGamingChatCMDs.LOOCCommand = { -- The command that sends looc message (ONLY USE ONE COMMAND)
    ["/looc"] = true
}


DeepGamingChatCMDs.EnableRolls = true -- Enables the Roll Feature.
DeepGamingChatCMDs.RollChatDistance = 250 -- The distance from the player rolling, that other players can see the roll results. 
DeepGamingChatCMDs.MinRollNumber = 0 -- Minimum Roll number (CANNOT BE NEGATIVE).
DeepGamingChatCMDs.MaxRollNumber = 100 -- Max Roll number (CANNOT EXCEED 127).

DeepGamingChatCMDs.RollCommands = { -- all possible commands to initiate a roll.
    ["/roll"] = true,
    ["!roll"] = true
}

