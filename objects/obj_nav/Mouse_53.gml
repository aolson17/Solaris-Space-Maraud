if room != ShipBuilder{
    if id = obj_player.navLink{
		
        if mouse_x > x-12 && mouse_x < x+12 && mouse_y > y-12 && mouse_y < y + 12{
            __view_set( e__VW.XPort, view_current, __view_get( e__VW.XPort, view_current ) * (2) )
            __view_set( e__VW.YPort, view_current, __view_get( e__VW.YPort, view_current ) * (2) )
        }
        
        mask_index = spr_nav_mask
        if mouse_x > bbox_left && mouse_x < bbox_right && mouse_y > bbox_top && mouse_y < bbox_bottom && global.inship = 0{
        
        if distance_to_object(obj_player) <= 12{
        
        global.inship = 1
        inship = 1
        
        }} else if mouse_x > bbox_left && mouse_x < bbox_right && mouse_y > bbox_top && mouse_y < bbox_bottom && global.inship = 1{
            global.inship = 0
            inship = 0
            __view_set( e__VW.XPort, view_current, __view_get( e__VW.XPort, view_current ) / (2) )
            __view_set( e__VW.YPort, view_current, __view_get( e__VW.YPort, view_current ) / (2) )
        }
        mask_index = spr_nav
    }
}

