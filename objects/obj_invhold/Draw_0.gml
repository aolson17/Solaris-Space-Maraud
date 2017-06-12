/// @description  Draw Item at Mouse
if global.inv[0,0] = -1 {}
if global.inv[0,0] = 0 {draw_sprite_ext(spr_scrap,0,mouse_x,mouse_y,1,1,obj_player.image_angle,c_white,1)}
if global.inv[0,0] = 1 {draw_sprite_ext(spr_gold,0,mouse_x,mouse_y,1,1,obj_player.image_angle,c_white,1)}
if global.inv[0,0] = 2 {draw_sprite_ext(spr_platinum,0,mouse_x,mouse_y,1,1,obj_player.image_angle,c_white,1)}
if global.inv[0,0] = 3 {draw_sprite_ext(spr_mis,0,mouse_x,mouse_y,1,1,obj_player.image_angle,c_white,1)}


