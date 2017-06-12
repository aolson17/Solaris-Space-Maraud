/// @description Open Platform
if room != ShipBuilder{
draw_sprite_ext(spr_plat,0,x,y,1,1,image_angle,c_white,1)
mask_index = spr_plat

// find position compared to player with rotation
adjx = lengthdir_x(point_distance(obj_player.x,obj_player.y,x,y),point_direction(obj_player.x,obj_player.y,x,y) - image_angle)
adjy = lengthdir_y(point_distance(obj_player.x,obj_player.y,x,y),point_direction(obj_player.x,obj_player.y,x,y) - image_angle)

if (ceil(adjy) < 0 + obj_player.sprite_height/2 + 1.8 || (keyboard_check(ord("S")))){// + obj_player.sprite_height/2 - sprite_height
    mask_index = -1
    //draw_text(x,y,string(adjx))
    //draw_text(x,y+10,string(adjy))
} else {
    mask_index = spr_plat
}

}else {
    draw_self()
}

