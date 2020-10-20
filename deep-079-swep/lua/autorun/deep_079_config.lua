AddCSLuaFile()
DeepGaming079 = DeepGaming079 or {}
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

DeepGaming079.LockDoorCD = 60 -- The time in seconds SCP-079 has to wait before locking a door.
DeepGaming079.LockTime = 25 -- The Time in seconds that a door remains locked for.

DeepGaming079.EnableTPMenu = true -- Enables SCP-079 Teleport Menu. This allows him to TP to "hotspots" defined in the code.

DeepGaming079.DonorLevel = 5 -- The level "keycard" access 079 will have if the player is a donator.
DeepGaming079.UserLevel = 3 -- The level "keycard" access 079 will have if the player is a regular user. 

DeepGaming079.TeleportCooldown = 3 -- The time between opening the menu

DeepGaming079.DoDoorsForceClose = true -- Should the doors shut when being locked by the swep?
DeepGaming079.DoDoorsForceOpen = false -- should the doors open after being unlocked by the swep?
DeepGaming079.DoorDistance = 150 -- Meh.. I wouldnt touch this, but this value is ^2 so keep it lower than 300 or else its like the 457 burn distance


DeepGaming079.DonorUserGroups =  {

    [ "superadmin" ] = true,
    [ "vip" ] = true,
    [ "user" ] = false,

}
