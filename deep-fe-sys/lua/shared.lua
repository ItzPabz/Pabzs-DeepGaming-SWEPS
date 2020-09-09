AddCSLuaFile()

function FindPlayer(Name)
    for k, v in pairs(player.GetAll()) do
        if(v:Nick() == Name) then
            return {
                steamid = v:SteamID(),
                steamid64 = v:SteamID64()
            }
        end
    end
end

function AddFERecord(NewRecord)
    local ExpectedRecord = {
        playername = NewRecord.playername,
        codetype = NewRecord.codetype or "",
        reason = NewRecord.reason or "",
        codenumber = NewRecord.codenumber or "",
        issuer = NewRecord.issuer or ""
    }

    net.Start("DEEPFE:SaveRecord")
        net.WriteTable(ExpectedRecord)
    net.SendToServer()
end

function LoadFERecord(PlayerName, recordList1)
    local PlayerRef = FindPlayer(PlayerName)
    local SteamID64 = PlayerRef.steamid64

    if(!file.Exists(DeepGamingFE.ReportDir.. SteamID64 ..".json", "DATA")) then
        recordList1:Clear()
        recordList1:AddLine("No results...")
    else
        recordList1:Clear()
        
        local Reports = util.JSONToTable(file.Read(DeepGamingFE.ReportDir.. SteamID64 ..".json", "DATA"))
        for k, v in pairs(Reports) do
            recordList1:AddLine( v.issuer, v.playername, v.codenumber, v.codetype, v.reason)
        end
    end
end