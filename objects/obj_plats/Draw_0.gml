/// @description Open Platform

draw_sprite(spr_plat,0,x,y)

if (y < obj_player.y + 17) || (keyboard_check(ord("S"))){
    mask_index = -1
} else {
    mask_index = spr_plat
}

