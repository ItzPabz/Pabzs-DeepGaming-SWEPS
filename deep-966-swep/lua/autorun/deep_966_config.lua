AddCSLuaFile()
DeepGaming966 = DeepGaming966 or {}

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

DeepGaming966.AttackCooldown = 0.65 -- the time in seconds before 966 can attack (prevents spam clicking)
DeepGaming966.MinDamage = 15 -- the minimum damage 966 deals
DeepGaming966.MaxDamage = 30 -- the maxiumum damage 966 deals

DeepGaming966.HighlightTeam = true -- Can 966 see each other?
DeepGaming966.HighlightTeamThroughWall = false -- Can they see each other through a wall?

DeepGaming966.SenseFLIR = true -- allow's SCP-966 to see anyone holding a FLIR camera through walls

DeepGaming966.EnableTaunting = true -- This enables the noises and the healing function for tuanting
DeepGaming966.MaxHealed = 1000 -- The max ammount of health 966 can go up to through taunting
DeepGaming966.TauntDelay = 45 -- Time in seconds 966 will need to wait before taunting again
DeepGaming966.MinHealthAmnt = 25 -- The min health healed after taunting 
DeepGaming966.MaxHealthAmnt = 60 -- The max health healed after taunting

DeepGaming966.FlirCamDelay = 60 -- the time in seconds, before you can reuse your flir camera
DeepGaming966.ActiveFlirTime = 7.5 -- the time in sec, the flir is active


--[[------------------------------
---- THERE IS ONE KNOWN ISSUE ----
----------------------------------
When dying with the FLIR Camera, while active it will make a client side error, as of right now idk any
fixes for this. But this is a free swep so... beggars cant be choosers :)
(jk, im looking for a fix rn)
]]--