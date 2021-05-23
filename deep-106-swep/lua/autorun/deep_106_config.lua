AddCSLuaFile()
DeepGaming106 = DeepGaming106 or {}
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
-- TO SET SCP-106s PD Teleport Location (for victim and scp) con command is # set_scp106_pd # --

DeepGaming106.PocketCooldown = 2 -- Time in seconds it takes for SCP-106 between pocketing humans
DeepGaming106.KillCooldown = 4 -- Time 106 has to wait before killing someone.

DeepGaming106.RunSpeed = 225 -- Multiplier for Run/Sprint speed. [240 is DARKRP DEFAULT]
DeepGaming106.WalkSpeed = 145 -- Multiplier for Walking speed. [160 IS DARKRP DEFAULT]

DeepGaming106.SCPJobs = { -- The jobs 106 can't succ into pd
    [ "SCP-610" ] = true,
    [ "Hobo" ] = true,
}





---------------------------
-- DONT EDIT BELOW ME <3 --
---------------------------
DeepGaming106.BlockedEntityIndexes = {
    [27] = true,
    [111] = true,
    [115] = true,
    [2146] = true,
    [119] = true,
    [1241] = true,
    [1245] = true,
    [1246] = true
  }







