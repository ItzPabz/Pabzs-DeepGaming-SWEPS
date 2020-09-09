if !SERVER then return end  

include('shared.lua')
resource.AddFile( "materials/deep-fe-sys/addentry-notice.png" )

util.AddNetworkString("DEEPFE:SaveRecord")
util.AddNetworkString("DEEPFE:RequestRecords")
util.AddNetworkString("DEEPFE:SendRecords")

if(!file.IsDir(DeepGamingFE.ReportDir, "DATA")) then
    file.CreateDir(DeepGamingFE.ReportDir)
end

function AddRecordToFile(NewRecord)
    -- Find the player
    local PlayerRef = FindPlayer(NewRecord.playername)
    local SteamID64 = PlayerRef.steamid64

    -- Check if the user already has a record file. If not, create one.
    if(!file.Exists(DeepGamingFE.ReportDir.. SteamID64 ..".json", "DATA")) then
        local Records = {}
        table.insert(Records, NewRecord)

        file.Write(DeepGamingFE.ReportDir.. SteamID64 ..".json", util.TableToJSON(Records, true))
    else
        local Records = util.JSONToTable(file.Read(DeepGamingFE.ReportDir.. SteamID64 ..".json", "DATA"))
        table.insert(Records, NewRecord)

        file.Write(DeepGamingFE.ReportDir.. SteamID64 ..".json", util.TableToJSON(Records, true))
    end
end

net.Receive("DEEPFE:SaveRecord", function()
    local NewRecord = net.ReadTable()

    AddRecordToFile(NewRecord)
end)

net.Receive("DEEPFE:RequestRecords", function(len, ply)
    local PlayerRef = FindPlayer(net.ReadString())
    local SteamID64 = PlayerRef.steamid64

    local Results = {}

    if(file.Exists(DeepGamingFE.ReportDir.. SteamID64 ..".json", "DATA")) then
        local Reports = util.JSONToTable(file.Read(DeepGamingFE.ReportDir.. SteamID64 ..".json", "DATA"))
        for k, v in pairs(Reports) do
            table.insert(Results, Reports)
        end
    end

    net.Start("DEEPFE:SendRecords")
        net.WriteTable(Results)
    net.Send(ply)
end)