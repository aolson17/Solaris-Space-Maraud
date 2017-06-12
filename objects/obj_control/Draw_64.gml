/// @description Draw GUI

mx = device_mouse_x_to_gui(0)
my = device_mouse_y_to_gui(0)

if keyboard_check(vk_rcontrol){
    draw_set_color(c_white)
    draw_text(mx+5,my+5,string_hash_to_newline("original_time/delta_time = " + string(original_time/delta_time)))
    draw_text(mx+5,my+35,string_hash_to_newline(delta_time))
    draw_text(mx+5,my+25,string_hash_to_newline(original_time))
}


