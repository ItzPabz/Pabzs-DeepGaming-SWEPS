local passivematerial = Material( "materials/scp457-custom/passive.png" ) 
local activematerial = Material( "materials/scp457-custom/onfire.png" )

function SWEP:DrawHUD()
    surface.SetDrawColor( 255, 255, 255, 255 )
    if current457EffectStatus == 1 then
        surface.SetMaterial( activematerial )
    end
    if current457EffectStatus == 0 then
        surface.SetMaterial( passivematerial ) 
    end
    surface.DrawTexturedRect( ScrW()/2 - 110, ScrH()/1.5, 160, 160 )
end
