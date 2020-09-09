AddCSLuaFile()

DeepGamingFE = DeepGamingFE or {}

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

DeepGamingFE.MenuKey = F6 -- The key used to open the menu.
DeepGamingFE.MenuTitle = "Foundation Enforcement Record Manager"

DeepGamingFE.ChatCommand = "!records" -- The chat command used to open the FE Record Manager

DeepGamingFE.PoliceJobs = { -- Add all jobs that can view and add
    [ "Hobo" ] = true, 
}

DeepGamingFE.ReportDir = "deep/player_reports/" -- GarrysMod / garrysmod / data / deep / player_reports