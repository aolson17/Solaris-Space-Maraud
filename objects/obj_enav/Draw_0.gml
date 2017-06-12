/// @description Draw Collision Box
draw_self()

//draw_text(x,y-15,targup)

if show = 1 {
draw_set_color(c_green)
draw_set_alpha(.2)
draw_rectangle(instance_nearest(-room_width,y,par_flyablesolid).x,instance_nearest(x,-room_height,par_flyablesolid).y,instance_nearest(room_width*2,y,par_flyablesolid).x + 5,instance_nearest(x,room_height*2,par_flyablesolid).y + 5,false)
draw_set_alpha(1)
depth = -5
}else {
    
    depth = 5
}

if room = ShipBuilder{
    if hold = 1{
        draw_set_alpha(.8)
        draw_self()
        draw_set_alpha(1)
        if collide = 1{
            draw_set_alpha(.5)
            draw_set_color(c_red)
            draw_rectangle(x - sprite_width / 2,y - sprite_height / 2,x + sprite_width / 2 - 1,y+sprite_height / 2 - 1,false)
            draw_set_alpha(1)
        }
    }
}

