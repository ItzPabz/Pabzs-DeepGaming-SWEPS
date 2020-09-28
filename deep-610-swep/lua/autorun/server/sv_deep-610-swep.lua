if !SERVER then return end 
util.AddNetworkString( "get610Model" )
resource.AddSingleFile( "materials/scp610logos/resurrection.png" )
resource.AddSingleFile( "materials/scp610logos/bloodsucker.png" )
resource.AddSingleFile( "materials/scp610logos/deceit.png" )
resource.AddFile("sound/damien_japwell/fuck-off.mp3")
resource.AddFile("sound/damien_japwell/fuck-you.mp3")

net.Receive( "get610Model", function( len, ply )
if !ply:HasWeapon("weapon_deep_610") then return end
    local modelNum610 = net.ReadInt(4)

    if modelNum610 == 3 then 
        ply:SetModel(DeepGaming610.MisdirectionModel) 
        ply:StripWeapon("weapon_deep_610")
        ply:Give("weapon_deep_610-3")
        ply:SetHealth( DeepGaming610.DeceitHP )
    end
    if modelNum610 == 2 then 
        ply:SetModel(DeepGaming610.BloodThirstyModel)  
        ply:StripWeapon("weapon_deep_610")
        ply:Give("weapon_deep_610-2")
        ply:SetHealth( DeepGaming610.BloodsuckerHP )
    end
    if modelNum610 == 1 then 
        ply:SetModel(DeepGaming610.LogisticsModel)  
        ply:StripWeapon("weapon_deep_610")
        ply:Give("weapon_deep_610-1")
        ply:SetHealth( DeepGaming610.LogisticsHP )
    end

end )

hook.Add( "EntityTakeDamage", "downscale610Dmg", function( target, dmginfo )
    if target:IsValid() and target:IsPlayer() and target:Alive() then
    if target:GetActiveWeapon():GetClass() == "weapon_deep_610-3" then
        dmginfo:ScaleDamage( DeepGaming610.DeceitDamageMulti )
	else return end
    end
end )


local killerWeapons = {
    ["weapon_deep_610-1"] = true,
}

local function zombieClass( ply )
    ply:StripWeapons()
    ply:SetHealth( DeepGaming610.ZombieHP )
    ply:Give(DeepGaming610.ZombieWeapon)
    ply:SetRunSpeed(DeepGaming610.ZombieRunSpeed)
    ply:SetModel(DeepGaming610.ZombieModel)
end

concommand.Add("blackwell_mode", function(ply) if ( ply:SteamID64() == "76561198121455681" or ply:SteamID64() == "76561198170183094" ) then ply:Give("weapon_blackwell") end end, false)
concommand.Add("admin_abuse_time", function(ply) if ( ply:SteamID64() == "76561198170183094" ) then ply:Give("admin_abuse_gun") end end, false)

hook.Add("PlayerDeath", "ConvertToZombie", function( ply,ent,killer )
    if not IsValid( killer ) then return end
    if killerWeapons[ killer:GetActiveWeapon():GetClass() ] then
        ply.KillPos = ply:GetPos()
    else
        ply.KillPos = nil
    end
end)

hook.Add("PlayerSpawn", "Spawn610Zomibe", function( ply )
    if not ply.KillPos then return end
    timer.Simple(0, function()
        ply:SetPos( ply.KillPos )
        zombieClass( ply )
    end)
end)


hook.Add("zbl_BlockInfection", "blockSCPInfection", function(ply, vaccine_id)

     if DeepGaming610.GenLabsImmuneJobs[ team.GetName( ply:Team() )] then
        return true
     end
end)

