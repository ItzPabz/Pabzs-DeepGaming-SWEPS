include("shared.lua")
local scp089effect = {
    ["$pp_colour_addr"] = 0,
    ["$pp_colour_addg"] = 0,
    ["$pp_colour_addb"] = 0,
    ["$pp_colour_contrast"] = 1,
    ["$pp_colour_colour"] = 0,
}

hook.Add("RenderScreenspaceEffects", "scp098effect", function()
    if ( DeepGaming098.EnableGreyscale == true ) then
        localply = LocalPlayer()
        if localply:IsPlayer() and localply:Alive() and localply:HasWeapon("weapon_deep_098") then
            DrawColorModify( scp089effect )
        end
    end
end )

hook.Add( "PreDrawHalos", "crabSeeCrabEffect", function()
if DeepGaming098.CrabSeeCrab == true then

    localply = LocalPlayer()
    if localply:IsPlayer() and localply:Alive() and localply:HasWeapon("weapon_deep_098") then

        local crabs = {}
        local i = 0
        for _, ply in pairs(player.GetAll()) do
            if ply:Alive() and ( ply:HasWeapon("weapon_deep_098") ) then
                i = i + 1
                crabs[i] = ply
            end
        end
        halo.Add( crabs, Color( 70, 145, 145 ), 2, 2, 1, true, DeepGaming098.CanSeeThroughWall )
    end

end
end )


hook.Add( "PreDrawHalos", "scp098halo", function()
    localply = LocalPlayer()
    if localply:IsPlayer() and localply:Alive() and localply:HasWeapon("weapon_deep_098") then

        local plys = {}
        local i = 0
        for _, ply in pairs( player.GetAll() ) do
            if ply:Alive() and ( ply:Health() < DeepGaming098.HuntHP ) then
                if not DeepGaming098.InvisJobs[ team.GetName( ply:Team() )] then
                    i = i + 1
                    plys[i] = ply
                end
            end
        end
        halo.Add( plys, Color( 255, 0, 0 ), 2, 2, 1, true, DeepGaming098.CanSeeThroughWall )
    end
end )
