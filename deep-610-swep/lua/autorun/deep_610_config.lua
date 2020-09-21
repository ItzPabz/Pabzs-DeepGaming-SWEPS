AddCSLuaFile()
DeepGaming610 = DeepGaming610 or {}
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

DeepGaming610.AttackCooldown = 0.65 -- the time in seconds before 610 can attack (prevents spam clicking)
DeepGaming610.MinDamage = 7 -- the minimum damage 610 deals
DeepGaming610.MaxDamage = 15 -- the maxiumum damage 610 deals

DeepGaming610.BloodsuckMultiplier = 0.5 -- this is the multiplier of health given back to the Blood thirty perk, so if its 1 it will give exact amount of health taken from the enemy, if 0.5 it will be half. 

DeepGaming610.EnableDifferentModels = true -- Enables the ability to have a different model for each type
DeepGaming610.LogisticsModel = "models/player/zombie_soldier.mdl"
DeepGaming610.BloodThirstyModel = "models/player/zombie_fast.mdl"
DeepGaming610.MisdirectionModel = "models/player/zombie_classic.mdl"

DeepGaming610.DeceitDamageMulti = 0.07 -- the damage multiplier taken taken by 610 when using deceit mode, (prevents metagaming)
                                      -- IF the player is dealt 100 damage they take 30 instead if the value was 0.3, if the value is 0.07
                                      -- they take 0.07 for every one damage

DeepGaming610.MaxBloodSuccHP = 7500

DeepGaming610.LogisticsHP = 5000 -- HP for resurrection mode
DeepGaming610.BloodsuckerHP = 3500 -- HP for bloodsucker
DeepGaming610.DeceitHP = 100 -- HP Set for the Deceit class, i suggest 100 to prevent metagame

DeepGaming610.ZombieWeapon = "weapon_ar2"
DeepGaming610.ZombieHP = 400
DeepGaming610.ZombieRunSpeed = 400
DeepGaming610.ZombieModel = "models/player/zombie_soldier.mdl"


DeepGaming610.ImmuneJobs = { -- The jobs 610 cant effect
    [ "SCP-610" ] = true,
    [ "Hobo" ] = true,
}

DeepGaming610.GenLabsImmuneJobs = { -- The jobs the virology mod cant effect
    [ "SCP-610" ] = true,
}

