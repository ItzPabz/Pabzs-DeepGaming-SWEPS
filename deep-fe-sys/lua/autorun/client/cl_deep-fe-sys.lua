if !CLIENT then return end

include('shared.lua')

local NewRecord = {}
local ScopedPlayer = nil
local RecordResultsReady = false

surface.CreateFont( "feSysFont", {
	font = "Arial", 
	size = 24,
    outline = true,
})
surface.CreateFont( "feSysFont_lg", {
	font = "Arial", 
	size = 32,
    outline = true,
})

surface.CreateFont( "feSysFont_sm", {
	font = "Arial", 
	size = 16,
    outline = true,
})

function openFERecordMgr()

    local scrw = ScrW() 
    local scrh = ScrH()
    local selfLocalPly = LocalPlayer()

    local BKMenuMain = vgui.Create( "DFrame" )
    BKMenuMain:SetPos(ScrW() / 2 - 465, ScrH() / 2 - 300)
    BKMenuMain:SetSize( 930, 600 ) 
    BKMenuMain:SetTitle( DeepGamingFE.MenuTitle ) 
    BKMenuMain:SetVisible( true ) 
    BKMenuMain:SetDraggable( false ) 
    BKMenuMain:ShowCloseButton( true ) 
    BKMenuMain:MakePopup()
    BKMenuMain:SetBackgroundBlur( true )
    local menuSelectorFE = vgui.Create("DPropertySheet", BKMenuMain)
    menuSelectorFE:Dock( FILL )

-----------------------------------------------------------------------------------

    local viewRecordsPage = vgui.Create( "DPanel", menuSelectorFE )
    menuSelectorFE:AddSheet( "View Records", viewRecordsPage, "icon16/folder_table.png" )

    local recordList1 = vgui.Create( "DListView", viewRecordsPage )
    recordList1:SetSize(875, 300)
    recordList1:SetPos(12,10)
    recordList1:SetMultiSelect( false )
    recordList1:AddColumn( "Issuer" )
    recordList1:AddColumn( "Offender" )
    recordList1:AddColumn( "Code #" )
    recordList1:AddColumn( "Code Type" )
    recordList1:AddColumn( "Reason" )

    recordList1.DoDoubleClick = function( lst, index, pnl )
        print( 
            "\n------------------------------------------ \n" ..
            "**Issuer:** " .. pnl:GetColumnText( 1 ) .. "\n" .. 
            "**Offender:** " .. pnl:GetColumnText( 2 ) .. "\n" ..
            "**Code #:** " .. pnl:GetColumnText( 3 ) .. "\n" .. 
            "**Code Type:** " .. pnl:GetColumnText( 4 ) .. "\n" .. 
            "**Reason:** " .. pnl:GetColumnText( 5 ) .. "\n" ..
            "------------------------------------------ \n")
    end

    local offenderNameLbl = vgui.Create("DLabel", viewRecordsPage)
    offenderNameLbl:SetText( "Member:")
    offenderNameLbl:SetSize(110, 32)
    offenderNameLbl:SetPos(15, 315)
    offenderNameLbl:SetTextColor(Color(255,255,255))
    offenderNameLbl:SetFont("feSysFont")

    local viewRecordSelecPly = vgui.Create("DComboBox", viewRecordsPage)
    viewRecordSelecPly:SetPos(110, 322)
    viewRecordSelecPly:SetSize(100, 20)
    viewRecordSelecPly:SetValue("Select Player")

    viewRecordSelecPly.OnSelect = function( _, _, value)
        ScopedPlayer = value
    end

    for k,v in pairs(player.GetAll()) do
        viewRecordSelecPly:AddChoice(v:Nick())
    end

    local submitSearchBttn = vgui.Create( "DButton", viewRecordsPage ) 
    submitSearchBttn:SetText( "Search" )	
    submitSearchBttn:SetPos( 15, 350 )
    submitSearchBttn:SetSize( 200, 30 )	
    submitSearchBttn.DoClick = function()
        -- LoadFERecord(ScopedPlayer, recordList1)
        net.Start("DEEPFE:RequestRecords")
            net.WriteString(ScopedPlayer)
        net.SendToServer()

        hook.Add("Think", "DEEPFE:RenderResults", function()
            if RecordResultsReady then
                recordList1:Clear()
                RecordResultsReady = false
                if ScopedRecords[1] ~= nil then
                    for k, v in pairs(ScopedRecords[1]) do
                        recordList1:AddLine( v.issuer, v.playername, v.codenumber, v.codetype, v.reason)
                    end
                else
                    recordList1:AddLine( "No results")
                end
            end
        end)
    end
-----------------------------------------------------------------------------------
    local addRecordPage = vgui.Create( "DPanel", menuSelectorFE )
    menuSelectorFE:AddSheet( "Add Record", addRecordPage, "icon16/table_edit.png" )

    local offenderNameLbl = vgui.Create("DLabel", addRecordPage)
    offenderNameLbl:SetText( "Offender: ")
    offenderNameLbl:SetSize(110, 32)
    offenderNameLbl:SetPos(5, 25)
    offenderNameLbl:SetTextColor(Color(255,255,255))
    offenderNameLbl:SetFont("feSysFont")

    local addRecordSelecPly = vgui.Create("DComboBox", addRecordPage)
    addRecordSelecPly:SetPos(105, 32)
    addRecordSelecPly:SetSize(100, 20)
    addRecordSelecPly:SetValue("Select Player")
    addRecordSelecPly.OnSelect = function( _, _, value)
        NewRecord.playername = value
    end
    for k,v in pairs(player.GetAll()) do
        addRecordSelecPly:AddChoice(v:Nick())
    end

    local codeNumLbl = vgui.Create("DLabel", addRecordPage)
    codeNumLbl:SetText( "Code #: " )
    codeNumLbl:SetSize(85, 32)
    codeNumLbl:SetPos(5, 64)
    codeNumLbl:SetTextColor(Color(255,255,255))
    codeNumLbl:SetFont("feSysFont")


    local codeNumberSel = vgui.Create( "DComboBox", addRecordPage )
    codeNumberSel:SetPos( 85, 68 )
    codeNumberSel:SetSize( 65, 20 )
    codeNumberSel:SetValue( "Code #" )
    codeNumberSel:AddChoice( "1.01" )
    codeNumberSel:AddChoice( "1.02" )
    codeNumberSel:AddChoice( "1.03" )
    codeNumberSel:AddChoice( "1.04" )
    codeNumberSel:AddChoice( "1.05" )
    codeNumberSel:AddChoice( "1.06" )
    codeNumberSel:AddChoice( "1.07" )
    codeNumberSel:AddChoice( "1.08" )
    codeNumberSel:AddChoice( "1.09" )
    codeNumberSel:AddChoice( "1.10" )
    codeNumberSel:AddChoice( "1.11" )

    codeNumberSel:AddChoice( "2.01" )
    codeNumberSel:AddChoice( "2.02" )
    codeNumberSel:AddChoice( "2.03" )
    codeNumberSel:AddChoice( "2.04" )
    codeNumberSel:AddChoice( "2.05" )
    codeNumberSel:AddChoice( "2.06" )

    codeNumberSel:AddChoice( "3.01" )
    codeNumberSel:AddChoice( "3.02" )
    codeNumberSel:AddChoice( "3.03" )
    codeNumberSel:AddChoice( "3.04" )
    codeNumberSel:AddChoice( "3.05" )
    codeNumberSel:AddChoice( "3.06" )
    codeNumberSel:AddChoice( "3.07" )
    codeNumberSel:AddChoice( "3.08" )
    codeNumberSel:AddChoice( "3.09" )
    codeNumberSel:AddChoice( "3.10" )

    codeNumberSel:AddChoice( "4.01" )
    codeNumberSel:AddChoice( "4.02" )
    codeNumberSel:AddChoice( "4.03" )
    codeNumberSel:AddChoice( "4.04" )
    codeNumberSel:AddChoice( "4.05" )
    codeNumberSel:AddChoice( "4.06" )
    codeNumberSel:AddChoice( "4.07" )
    
    codeNumberSel:AddChoice( "5.01" )
    codeNumberSel:AddChoice( "5.02" )
    codeNumberSel:AddChoice( "5.03" )
    codeNumberSel:AddChoice( "5.04" )
    codeNumberSel:AddChoice( "5.05" )

    codeNumberSel:AddChoice( "6.01" )
    codeNumberSel:AddChoice( "6.02" )
    codeNumberSel:AddChoice( "6.03" )
    codeNumberSel:AddChoice( "6.04" )
    codeNumberSel:AddChoice( "6.05" )
    codeNumberSel:AddChoice( "6.06" )
    codeNumberSel:AddChoice( "6.07" )
    codeNumberSel:AddChoice( "6.08" )
    codeNumberSel:AddChoice( "6.09" )
    codeNumberSel:AddChoice( "6.10" )
    codeNumberSel:AddChoice( "6.11" )
    codeNumberSel:AddChoice( "6.12" )
    codeNumberSel:AddChoice( "6.15" )
    codeNumberSel.OnSelect = function( self, index, value )
       NewRecord.codenumber = value
    end

    local codeTypeLbl = vgui.Create("DLabel", addRecordPage)
    codeTypeLbl:SetText( "Code Type: " )
    codeTypeLbl:SetSize(125, 32)
    codeTypeLbl:SetPos(5, 96)
    codeTypeLbl:SetTextColor(Color(255,255,255))
    codeTypeLbl:SetFont("feSysFont")

    local codeTypeSel = vgui.Create( "DComboBox", addRecordPage )
    codeTypeSel:SetPos( 125, 102 )
    codeTypeSel:SetSize( 80, 20 )
    codeTypeSel:SetValue( "Code Type" )
    codeTypeSel:AddChoice( "Infraction" )
    codeTypeSel:AddChoice( "Misdemeanor" )
    codeTypeSel:AddChoice( "Felony" )
    codeTypeSel:SetSortItems( false )
    codeTypeSel.OnSelect = function( self, index, value )
       NewRecord.codetype = value
    end



    local reasonLbl = vgui.Create("DLabel", addRecordPage)
    reasonLbl:SetText( "Reason: " )
    reasonLbl:SetSize(110, 32)
    reasonLbl:SetPos(5, 128)
    reasonLbl:SetTextColor(Color(255,255,255))
    reasonLbl:SetFont("feSysFont")

    local reasonTxt = vgui.Create( "DTextEntry", addRecordPage ) 
    reasonTxt:SetPos( 92, 132 )
    reasonTxt:SetSize( 350, 20 )
    reasonTxt:SetValue( "Insert Reason..." )
    reasonTxt.OnChange = function()
        NewRecord.reason = reasonTxt:GetValue()
    end

    local submitNewRecordBttn = vgui.Create( "DButton", addRecordPage ) 
    submitNewRecordBttn:SetText( "Submit" )	
    submitNewRecordBttn:SetPos( 5, 192 )
    submitNewRecordBttn:SetSize( 500, 30 )	
    submitNewRecordBttn.DoClick = function()
        NewRecord.issuer = LocalPlayer():Nick() .. " (".. LocalPlayer():SteamID() .. ")"
        AddFERecord(NewRecord)
        BKMenuMain:Close()
        LocalPlayer():ChatPrint("You have submitted a new record!")
    end

    local feNoticePNG = Material( "materials/deep-fe-sys/addentry-notice.png" )
    
    local feNoticeRect = vgui.Create("DPanel", addRecordPage)
    feNoticeRect:SetSize(383,510)
    feNoticeRect:SetPos( 512, 10)
    feNoticeRect.Paint = function( self, w, h )
        surface.SetDrawColor( 255, 255, 255, 255 )
        surface.SetMaterial( feNoticePNG )
        surface.DrawTexturedRect( 0, 0, 383,510 )
    end
---------------------------------------------------------------------------------
    local viewPenalCode = vgui.Create( "DPanel", menuSelectorFE )
    menuSelectorFE:AddSheet( "View Penal Code", viewPenalCode, "icon16/page_white_find.png" )
    local penalCodeSite = vgui.Create("DHTML", viewPenalCode)
    penalCodeSite:Dock(FILL)
    penalCodeSite:OpenURL( "https://docs.google.com/spreadsheets/d/17y1vS9JyQvqbzkJiowxnKUOQn6A6KPrJzqfXYDfH5Ts/edit#gid=0" )
end

concommand.Add( "openrecordmanager", function( ply )
if not DeepGamingFE.PoliceJobs[ team.GetName( ply:Team() )] then ply:ChatPrint("Your job does not have access to the Record Manager!") return end
openFERecordMgr()
end)

hook.Add( "OnPlayerChat", "OpenFEMenu", function( ply, strText) 
    if ( ply != LocalPlayer() ) then return end
	strText = string.lower( strText )

	if ( strText == "!records" ) then
        if not DeepGamingFE.PoliceJobs[ team.GetName( ply:Team() )] then ply:ChatPrint("Your job does not have access to the Record Manager!") return true end
		openFERecordMgr()
		return true
	end
end )

net.Receive("DEEPFE:SendRecords", function()
    local Records = net.ReadTable()
    ScopedRecords = {}
    ScopedRecords = Records
    RecordResultsReady = true
end)