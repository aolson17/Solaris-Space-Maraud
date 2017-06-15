if enavLink != noone{
    draw_rectangle_colour(enavLink.x-8,enavLink.y-8,enavLink.x+8,enavLink.y+8, c_yellow, c_yellow, c_yellow, c_yellow, false)
	draw_set_color(c_white)
	draw_text(enavLink.x-80,enavLink.y-300,"key_left: "+string(enavLink.key_left))
	draw_text(enavLink.x-80,enavLink.y-320,"key_right: "+string(enavLink.key_right))
	draw_text(enavLink.x-80,enavLink.y-340,"key_up: "+string(enavLink.key_up))
	draw_text(enavLink.x-80,enavLink.y-360,"key_down: "+string(enavLink.key_down))
	
	draw_text(enavLink.x-180,enavLink.y-320,"hsp: "+string(enavLink.hsp))
	draw_text(enavLink.x-180,enavLink.y-340,"vsp: "+string(enavLink.vsp))
	
	draw_text(enavLink.x-180,enavLink.y-380,"moveh: "+string(enavLink.moveh))
	draw_text(enavLink.x-180,enavLink.y-400,"movev: "+string(enavLink.movev))
	
	draw_text(enavLink.x-180,enavLink.y-480,"movespeed: "+string(enavLink.movespeed))
	
	draw_text(enavLink.x-80,enavLink.y-400,"thrust_left: "+string(enavLink.thrust_left))
	draw_text(enavLink.x-80,enavLink.y-420,"thrust_right: "+string(enavLink.thrust_right))
	draw_text(enavLink.x-80,enavLink.y-440,"thrust_up: "+string(enavLink.thrust_up))
	draw_text(enavLink.x-80,enavLink.y-460,"thrust_down: "+string(enavLink.thrust_down))
}    for(i=0;i<=ds_list_size(global.enemyship);i++){
        with(ds_list_find_value(global.enemyship,i)){
            draw_rectangle_colour(x-5,y-5,x+5,y+5, c_red, c_red, c_red, c_red, false)
        }
    }
//}

for(i=0;i<=ds_list_size(global.playership);i++){
        with(ds_list_find_value(global.playership,i)){
            draw_rectangle_colour(x-5,y-5,x+1,y+5, c_blue, c_blue, c_blue, c_blue, false)
        }
    }

