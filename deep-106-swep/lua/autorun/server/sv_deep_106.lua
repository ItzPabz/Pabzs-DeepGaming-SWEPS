util.AddNetworkString("106teleport")
util.AddNetworkString("Deep106.OpenMenu")
util.AddNetworkString("106returntopos")

resource.AddFile( "sound/deep106swep/laugh.wav" )
resource.AddFile( "sound/deep106swep/breathing.wav" )


net.Receive("106returntopos", function(_,ply)
    if not ply:IsValid() then return end
    if not ply:Alive() then return end
    if not ply:HasWeapon("weapon_deep_106") then return end
    if not nospam(ply) then return end
    if oldPosition106 == nil then return end
        local pos = ply:GetPos()
        local target = pos - Vector(0,0,100)   
        timer.Create("106tele" .. ply:SteamID64(),0.1,0, function() 
            pos = Lerp(0.05, pos, target) ply:SetPos(pos) 
        end)

        timer.Create("106teleend" .. ply:SteamID64(), 5, 1, function()
            if IsValid(ply) then
                timer.Destroy("106tele" .. ply:SteamID64())
                ply:SetPos( oldPosition106 )
                oldPosition106 = nil
            end
        end)


end)

net.Receive("106teleport", function(_,ply)
    if not ply:IsValid() then return end
    if not ply:Alive() then return end
    if not ply:HasWeapon("weapon_deep_106") then return end
    if not nospam(ply) then return end
        oldPosition106 = ply:GetPos()
        local pos = ply:GetPos()
        local target = pos - Vector(0,0,100)   
        timer.Create("106tele" .. ply:SteamID64(),0.1,0, function() 
            pos = Lerp(0.05, pos, target) ply:SetPos(pos) 
        end)

        timer.Create("106teleend" .. ply:SteamID64(), 5, 1, function()
            if IsValid(ply) then
                timer.Destroy("106tele" .. ply:SteamID64())
                local data = file.Read("scpsweps/106pos.txt")
                data = string.Explode(";", data)
                if data != nil then
                    ply:SetPos( Vector(tonumber(data[1]),tonumber(data[2]),tonumber(data[3])) )
                end
            end
        end)
end)

local nospamt = {}
function nospam(ply)
    if nospamt[ply] != nil then
        if nospamt[ply] < CurTime() then
            nospamt[ply] = nil
            return true
        else
            return false
        end
    else
        nospamt[ply] = CurTime() + 2
        return true
    end
end

concommand.Add("set_scp106_pd", function(ply)
    if not ply:IsSuperAdmin() then return end
    local pos = ply:GetPos()
    if file.Exists("scpsweps/106pos.txt", "DATA") then
        file.Write("scpsweps/106pos.txt", tostring(pos.x) .. ";" .. tostring(pos.y) .. ";" .. tostring(pos.z))
    else
        if not file.Exists("scpsweps", "DATA") then file.CreateDir("scpsweps") end
        file.Write("scpsweps/106pos.txt", tostring(pos.x) .. ";" .. tostring(pos.y) .. ";" .. tostring(pos.z))
    end
    ply:ChatPrint("You have set 106's Pocket Dimension!")
end)