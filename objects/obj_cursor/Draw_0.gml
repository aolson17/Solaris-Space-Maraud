/// @description Don't Draw Self


mx = device_mouse_x_to_gui(0)
my = device_mouse_y_to_gui(0)
/*
part = collision_point(x,y,par_flyable,true,true)
if part != noone{
	//show_message(string(object_get_name(part.object_index)))

	with(part){
		//show_message(string(object_get_name(object_index)))
		for(i=0;i<=ds_list_size(global.playership);i++){// sort par_obj
			if id = ds_list_find_value(global.playership,i){
				other.part_depth = i
			}
		}
	
	
	}
	
	draw_set_color(c_yellow)
	draw_text(10,10,part_depth)
	
}else{
	///show_message("part = noone")
}
