draw_set_alpha(.8)
draw_self()
draw_set_alpha(1)
if keyboard_check(vk_shift) && global.selected = object_index {
    draw_set_alpha(.5)
    draw_set_color(c_green)
    draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false)
    draw_set_alpha(1)
}else if collide = 1{
    draw_set_alpha(.5)
    draw_set_color(c_red)
    draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false)
    draw_set_alpha(1)
}

