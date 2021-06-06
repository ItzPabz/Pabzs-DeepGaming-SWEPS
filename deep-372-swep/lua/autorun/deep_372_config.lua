AddCSLuaFile()
DeepGaming372 = DeepGaming372 or {}

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

DeepGaming372.KillCooldown = 5 -- Time 372 has to wait before trying to kill again.
DeepGaming372.ScanCooldown = 10 -- Time 372 waits before scanning players nearby (RELOAD KEY)
DeepGaming372.MaxVictimDistance = 5000 -- Max distance 372 tracks people, do not set to a super high value, may cause lag as it calulcates each players vector to the player.
DeepGaming372.HighlightVictim = true -- Will the swep create a glow around the target for easier tracking?

DeepGaming372.InvisTime = 45 -- Time in seconds SCP-372 is invisible for before flicker.
DeepGaming372.FlickerTime = 0.1 -- Time in seconds SCP-372 is visible before cloaking again.

DeepGaming372.SCPJobs = { -- Jobs that SCP-372 cant target/lock onto. 
    [ "SCP-610" ] = true,
    [ "SCP-049" ] = true,
    [ "Hobo" ] = true,
}


