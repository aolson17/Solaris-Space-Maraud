draw_set_alpha(.8)
draw_self()
draw_set_alpha(1)
if keyboard_check(vk_shift){
    draw_set_alpha(.5)
    draw_set_color(c_green)
    draw_rectangle(x - sprite_width / 2,y - sprite_height / 2,x + sprite_width / 2 - 1,y+sprite_height / 2 - 1,false)
    draw_set_alpha(1)
}else if collide = 1{
    draw_set_alpha(.5)
    draw_set_color(c_red)
    draw_rectangle(x - sprite_width / 2,y - sprite_height / 2,x + sprite_width / 2 - 1,y+sprite_height / 2 - 1,false)
    draw_set_alpha(1)
}

