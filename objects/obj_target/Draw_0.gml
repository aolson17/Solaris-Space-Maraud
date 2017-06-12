draw_sprite(spr_target,image_index,x,y)

if targetx != 0 {
// Draw Target Path
for(i=0;i<abs((obj_marker.y + 20 - targety)/40);i++){// path up
if sign(obj_marker.y + 20 - targety) = -1{
draw_sprite(spr_path,image_index,obj_marker.x,obj_marker.y+((i)*40))
}
if sign(obj_marker.y + 20 - targety) = 1{
draw_sprite(spr_path,image_index,obj_marker.x,obj_marker.y+((i)*-40))
}
}
for(i=1;i<abs((obj_marker.x + 20 - targetx)/40);i++){// path side
if sign(obj_marker.x + 20 - targetx) = -1{
//instance_create(obj_marker.x+((i)*40),targety,obj_pathside)
draw_sprite_ext(spr_path,image_index,obj_marker.x+((i)*40),targety + 20,1,1,90,c_white,1)
}
if sign(obj_marker.x + 20 - targetx) = 1{
//instance_create(obj_marker.x+((i)*-40),targety,obj_pathside)
draw_sprite_ext(spr_path,image_index,obj_marker.x+((i)*-40),targety + 20,1,1,90,c_white,1)
}
}

// Draw Corner
draw_sprite_ext(spr_corner,image_index,obj_marker.x + 20,targety,1*-sign(obj_marker.x + 20 - targetx),1*sign(obj_marker.y + 20 - targety),0,c_white,1)
// Draw Spot
if sign(obj_marker.x + 20 - targetx) = -1{
draw_sprite_ext(spr_spot,image_index,targetx,targety,1*sign(obj_marker.x + 20 - targetx),1,0,c_white,1)
}
if sign(obj_marker.x + 20 - targetx) = 1{
draw_sprite_ext(spr_spot,image_index,targetx - 2,targety,1*sign(obj_marker.x + 20 - targetx),1,0,c_white,1)
}
if sign(obj_marker.x + 20 - targetx) = 0{
if sign(obj_marker.y + 20 - targety) = -1{
draw_sprite_ext(spr_spot,image_index,targetx,targety,1,1,90,c_white,1)
}
if sign(obj_marker.y + 20 - targety) = 1{
draw_sprite_ext(spr_spot,image_index,targetx,targety - 2,1,1,270,c_white,1)
}
}

}

