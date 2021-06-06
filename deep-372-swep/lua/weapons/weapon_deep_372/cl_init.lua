include("shared.lua")

surface.CreateFont( "font372", {
	font = "Arial",
	extended = false,
	size = 48,
	weight = 500,
    outline = false,
} )

function SWEP:Deploy()
    self:SetHoldType( "normal" )
end

net.Receive( "deep372_victim_net", function( _, ply )
    plyVictim = net.ReadEntity()
end)

hook.Add("HUDPaint", "scp372status", function()
    if not IsValid(LocalPlayer():GetActiveWeapon()) then return end
    if LocalPlayer():GetActiveWeapon():GetClass() ~= "weapon_deep_372" then return end
    if plyVictim == nil then return end
    draw.SimpleText( plyVictim:Nick(), "font372", ScrW()/2, ScrH()/5, Color(255,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

end)


hook.Add( "PreDrawHalos", "highlight372Victim", function()
if DeepGaming372.HighlightVictim then
    if not IsValid(LocalPlayer():GetActiveWeapon()) then return end
    if LocalPlayer():GetActiveWeapon():GetClass() ~= "weapon_deep_372" then return end
    halo.Add( {plyVictim}, Color( 255, 0, 0 ), 2, 2, 1, true, true )
end
end )
