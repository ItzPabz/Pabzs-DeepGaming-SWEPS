AddCSLuaFile()
DeepGaming098 = DeepGaming098 or {}

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

DeepGaming098.AttackCooldown = 0.65 -- the time in seconds before 098 can attack (prevents spam clicking)
DeepGaming098.MinDamage = 7 -- the minimum damage 098 deals
DeepGaming098.MaxDamage = 15 -- the maxiumum damage 098 deals

DeepGaming098.EnableGreyscale = true -- Makes the crabs screens greyscale, basically makes everything grey

DeepGaming098.CrabSeeCrab = true -- Can crabs see each other through walls?

DeepGaming098.CanSeeThroughWall = true -- Allows SCP-098 to see targets through walls, if FALSE then it will still glow but u have to have LOS. Also there may be a wierd graphic bug with the players eyes
DeepGaming098.HuntHP = 75 -- The min hp needed to see  
DeepGaming098.InvisJobs = { -- Add all jobs that you DONT WANT TO have 098 see red (u can basically use 457 config for this)

    [ "SCP-098" ] = true, 
    [ "SCP-049" ] = true, 
    [ "SCP-035" ] = true,
    [ "SCP-343 [VIP]" ] = true,
    [ "Foundation E.B.U. [Custom]" ] = true,
    [ "S.I.D. Biohazard Unit" ] = false, 

}
