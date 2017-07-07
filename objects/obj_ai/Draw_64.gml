/*
if enavLink != noone{
    draw_text(500,500,string_hash_to_newline(ds_list_size(global.enemyship)))
}
if enavLink != noone{

	draw_set_color(c_white)
	draw_text(80,240,"curr: "+string(enavLink.curr))
	draw_text(80,260,"key_cw: "+string(enavLink.key_cw))
	draw_text(80,280,"key_ccw: "+string(enavLink.key_ccw))
	draw_text(80,300,"key_left: "+string(enavLink.key_left))
	draw_text(80,320,"key_right: "+string(enavLink.key_right))
	draw_text(80,340,"key_up: "+string(enavLink.key_up))
	draw_text(80,360,"key_down: "+string(enavLink.key_down))
	
	draw_text(280,320,"hsp: "+string(enavLink.hsp))
	draw_text(280,340,"vsp: "+string(enavLink.vsp))
	
	draw_text(280,380,"moveh: "+string(enavLink.moveh))
	draw_text(280,400,"movev: "+string(enavLink.movev))
	
	draw_text(280,480,"movespeed: "+string(enavLink.movespeed))
	
	draw_text(80,400,"thrust_left: "+string(enavLink.thrust_left))
	draw_text(80,420,"thrust_right: "+string(enavLink.thrust_right))
	draw_text(80,440,"thrust_up: "+string(enavLink.thrust_up))
	draw_text(80,460,"thrust_down: "+string(enavLink.thrust_down))
	
	draw_text(200,200,"Closeness: "+string(abs(point_distance(enavLink.x+curh,enavLink.y+curv,obj_player.navLink.x,obj_player.navLink.y) - closeness)))
	draw_text(200,220,"Angle Closeness: "+string(abs(abs(image_angle+curr - obj_player.navLink.image_angle))))
}