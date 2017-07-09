/// @description Insert description here
// You can write your code in this editor
if distance_to_point(mouse_x,mouse_y)<10{
	for(i=0;i<=ds_list_size(global.playership);i++){// sort par_obj
		if id = ds_list_find_value(global.playership,i){
			draw_set_color(c_blue)
			draw_text(x,y,i)
		}
	}
}