draw_self()

midx = x + sprite_width/2
midy = y + sprite_height/2 + 22
scale = .05
divided = 20

if image_index = 0{

//Player Ship
with(par_flyablesolid){
other.depth = depth
if sprite_index != -1{
draw_sprite_ext(sprite_index,image_index,x/other.divided + other.midx,y/other.divided + other.midy,other.scale,other.scale,0,c_white,1)
}

}
with(par_flyable){
other.depth = depth - 1001
if sprite_index != -1 && object_index != obj_player && object_index != obj_life{
draw_sprite_ext(sprite_index,0,x/other.divided + other.midx,y/other.divided + other.midy,other.scale,other.scale,0,c_white,1)
}

if object_index = obj_life{draw_sprite_ext(spr_backmetal,0,x/other.divided + other.midx,y/other.divided + other.midy,other.scale,other.scale,0,c_white,1)}

}
//Enemy Ship
with(par_enemysolid){
other.depth = depth
if sprite_index != -1{
draw_sprite_ext(sprite_index,image_index,x/other.divided + other.midx,y/other.divided + other.midy,other.scale,other.scale,0,c_white,1)
}

}
with(par_enemy){
other.depth = depth - 1001
if sprite_index != -1 && object_index != obj_player && object_index != obj_life{
draw_sprite_ext(sprite_index,0,x/other.divided + other.midx,y/other.divided + other.midy,other.scale,other.scale,0,c_white,1)
}

if object_index = obj_life{draw_sprite_ext(spr_backmetal,0,x/other.divided + other.midx,y/other.divided + other.midy,other.scale,other.scale,0,c_white,1)}

}
}

depth = -1000

