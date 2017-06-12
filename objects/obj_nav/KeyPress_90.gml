if mouse_x > x-12 && mouse_x < x+12 && mouse_y > y-12 && mouse_y < y + 12 && room != ShipBuilder{
    __view_set( e__VW.XPort, view_current, __view_get( e__VW.XPort, view_current ) * (2) )
    __view_set( e__VW.YPort, view_current, __view_get( e__VW.YPort, view_current ) * (2) )
}

if mouse_x > x-64 && mouse_x < x+64 && mouse_y > y-64 && mouse_y < y + 64 && room != ShipBuilder && global.inship = 0{

if distance_to_object(obj_player) <= 12 && obj_player.y < y{

global.inship = 1

}} else if mouse_x > x-64 && mouse_x < x+64 && mouse_y > y-64 && mouse_y < y + 64 && room != ShipBuilder && global.inship = 1{
    global.inship = 0
    __view_set( e__VW.XPort, view_current, __view_get( e__VW.XPort, view_current ) / (2) )
    __view_set( e__VW.YPort, view_current, __view_get( e__VW.YPort, view_current ) / (2) )
}

