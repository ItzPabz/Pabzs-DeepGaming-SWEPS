AddCSLuaFile()
DeepGaming457 = DeepGaming457 or {}

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

DeepGaming457.BurnTime = 1 -- the time the player will be on fire for (even after running away from 457)
DeepGaming457.BurnDistance = 350 -- The distance the victims needs to be within in order to get burned 
DeepGaming457.AntiSpamTime = 3 -- Time between 457 can re-ignite after manually switching it off

DeepGaming457.StartingSize = 0.75 -- The starting size the player when weakend. (1 is the models normal size)
DeepGaming457.MaxSize = 1.35 -- The largest ammount the player can become, I dont recommend anything larger than 1.35, or else it may look funky.

DeepGaming457.EnableHeatWave = true -- Enables the Heatwave Special Attack
DeepGaming457.HeatWaveCooldown = 300 -- The cooldown before the player can do the Heat Wave ability in seconds. (300 seconds = 5 mins)
DeepGaming457.SetNextBurn = 10 -- The amount of time before SCP-457 can burn the players nearby again.
DeepGaming457.StunnedTime = 3 -- The time players hit by a heat wave are stunned
DeepGaming457.BoomDamage = math.random( 20, 50 ) -- The amount of damage the victim takes when 457 booms

DeepGaming457.ImmuneJobs = { -- Add all jobs that you DONT WANT TO catch fire. Must be spelled EXACTLY AS IN JOBS.LUA.

    [ "SCP-457" ] = false, -- DO NOT SET 457 to TRUE, because fire wont be on him.
    [ "SCP-049" ] = true, 
    [ "SCP-035" ] = true,
    [ "SCP-343 [VIP]" ] = true,
    [ "Foundation E.B.U. [Custom]" ] = true,
    [ "S.I.D. Biohazard Unit" ] = false, -- you dont need to have the non-immune jobs, this is here for example. Or if u wanna edit a job quickly.

}





