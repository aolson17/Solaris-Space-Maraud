/// @description  Find position compared to center of ship for rotaion



if room!=ShipBuilder{
    if ds_list_find_index(global.playership, id) != -1{ //If part of player ship
        if scr_rotated(x) > obj_player.navLink.x{
            posx = "right"
        }else {posx = "left"}
        
        if scr_rotated(y) > obj_player.navLink.y{
            posy = "down"
        }else {posy = "up"}
        
        rotpos = "cw"
    }else if ds_list_find_index(global.enemyship, id) != -1{
        if scr_rotated(x) > obj_player.navLink.x{
            posx = "right"
        }else {posx = "left"}
        
        if scr_rotated(y) > obj_player.navLink.y{
            posy = "down"
        }else {posy = "up"}
        
        rotpos = "cw"
    }
}



