/// @description Open Platform
if room != ShipBuilder{
//draw_sprite_ext(spr_plat,0,x,y,1,1,image_angle,c_white,1)
//mask_index = spr_plat

// find position compared to player with rotation
//adjx = lengthdir_x(point_distance(obj_player.x,obj_player.y,scr_rotated(x),scr_rotated(y)),point_direction(obj_player.x,obj_player.y,scr_rotated(x),scr_rotated(y)) - image_angle)
//adjy = lengthdir_y(point_distance(obj_player.x,obj_player.y,scr_rotated(x),scr_rotated(y)),point_direction(obj_player.x,obj_player.y,scr_rotated(x),scr_rotated(y)) - image_angle)

if (ceil(y) < obj_player.y + obj_player.sprite_height/2 + 1.8 || (keyboard_check(ord("S")))){// + obj_player.sprite_height/2 - sprite_height
    sprite_index = -1
    //draw_text(x,y,string(adjx))
    //draw_text(x,y+10,string(adjy))
} else {
    sprite_index = spr_plat
}

}else {
    event_inherited()
}

