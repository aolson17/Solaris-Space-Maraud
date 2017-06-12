draw_self()
if keyboard_check(ord("B")){
    draw_set_alpha(.5)
    draw_set_color(c_red)
    draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false)
    draw_set_alpha(1)
}

