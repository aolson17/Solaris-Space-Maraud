/// @description Draw Collision Box
draw_self()

if room = ShipBuilder{
	with(par_flyable){
		draw_sprite(sprite_index,image_index,x,y)
	}
	with(par_flyablesolid){
		if object_index = obj_turretdown{
			draw_sprite_ext(sprite_index,image_index,x,y,1,1,180,c_white,1)
		}else if object_index = obj_turretleft{
			draw_sprite_ext(sprite_index,image_index,x,y,1,1,90,c_white,1)
		}else if object_index = obj_turretright{
			draw_sprite_ext(sprite_index,image_index,x,y,1,1,-90,c_white,1)
		}else{
			draw_sprite(sprite_index,image_index,x,y)
		}
	}with(par_obj){
		draw_sprite(sprite_index,image_index,x,y)
	}
}


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


if room != ShipBuilder{
	if id = obj_player.navLink {
		for(i=0;i<=ds_list_size(global.playership);i++){
		    with(ds_list_find_value(global.playership,i)){
	        
			
				if sprite_exists(sprite_index) || object_index = obj_plat{
					if !object_is_ancestor(object_index,par_turret){
						if object_index = obj_plat{
							draw_sprite_ext(spr_plat,1,navLink.x+lengthdir_x(point_distance(x, y, navLink.x, navLink.y),point_direction(navLink.x,navLink.y,x,y) + round(navLink.orbit_angle*10)/10),navLink.y+lengthdir_y(point_distance(x, y, navLink.x, navLink.y),point_direction(navLink.x,navLink.y,x,y) + round(navLink.orbit_angle*10)/10),1,1,round(navLink.orbit_angle*10)/10,c_white,1)
						}else{
							draw_sprite_ext(sprite_index,image_index,navLink.x+lengthdir_x(point_distance(x, y, navLink.x, navLink.y),point_direction(navLink.x,navLink.y,x,y) + round(navLink.orbit_angle*10)/10),navLink.y+lengthdir_y(point_distance(x, y, navLink.x, navLink.y),point_direction(navLink.x,navLink.y,x,y) + round(navLink.orbit_angle*10)/10),1,1,round(navLink.orbit_angle*10)/10,c_white,1)
						}
					}else{
						switch(object_index){
							case obj_turret: draw_sprite_ext(sprite_index,image_index,navLink.x+lengthdir_x(point_distance(x, y, navLink.x, navLink.y),point_direction(navLink.x,navLink.y,x,y) + round(navLink.orbit_angle*10)/10),navLink.y+lengthdir_y(point_distance(x, y, navLink.x, navLink.y),point_direction(navLink.x,navLink.y,x,y) + round(navLink.orbit_angle*10)/10),1,1,round(navLink.orbit_angle*10)/10,c_white,1)
							break
							case obj_turretdown: draw_sprite_ext(sprite_index,image_index,navLink.x+lengthdir_x(point_distance(x, y, navLink.x, navLink.y),point_direction(navLink.x,navLink.y,x,y) + round(navLink.orbit_angle*10)/10),navLink.y+lengthdir_y(point_distance(x, y, navLink.x, navLink.y),point_direction(navLink.x,navLink.y,x,y) + round(navLink.orbit_angle*10)/10),1,1,180+round(navLink.orbit_angle*10)/10,c_white,1)
							break
							case obj_turretleft: draw_sprite_ext(sprite_index,image_index,navLink.x+lengthdir_x(point_distance(x, y, navLink.x, navLink.y),point_direction(navLink.x,navLink.y,x,y) + round(navLink.orbit_angle*10)/10),navLink.y+lengthdir_y(point_distance(x, y, navLink.x, navLink.y),point_direction(navLink.x,navLink.y,x,y) + round(navLink.orbit_angle*10)/10),1,1,90+round(navLink.orbit_angle*10)/10,c_white,1)
							break
							case obj_turretright: draw_sprite_ext(sprite_index,image_index,navLink.x+lengthdir_x(point_distance(x, y, navLink.x, navLink.y),point_direction(navLink.x,navLink.y,x,y) + round(navLink.orbit_angle*10)/10),navLink.y+lengthdir_y(point_distance(x, y, navLink.x, navLink.y),point_direction(navLink.x,navLink.y,x,y) + round(navLink.orbit_angle*10)/10),1,1,-90+round(navLink.orbit_angle*10)/10,c_white,1)
							break
						
						}
					}
				}else{
					ds_list_delete(global.playership,other.i)
					break
				}
		    }
		}
	}else if id = obj_ai.enavLink{
		for(i=0;i<=ds_list_size(global.enemyship);i++){
		    with(ds_list_find_value(global.enemyship,i)){
	        
			
				if sprite_exists(sprite_index) || object_index = obj_plat{
					if !object_is_ancestor(object_index,par_turret){
						if object_index = obj_plat{
							draw_sprite_ext(spr_plat,1,obj_ai.enavLink.x+lengthdir_x(point_distance(x, y, obj_ai.enavLink.x, obj_ai.enavLink.y),point_direction(obj_ai.enavLink.x,obj_ai.enavLink.y,x,y) + round(obj_ai.enavLink.orbit_angle*10)/10),obj_ai.enavLink.y+lengthdir_y(point_distance(x, y, obj_ai.enavLink.x, obj_ai.enavLink.y),point_direction(obj_ai.enavLink.x,obj_ai.enavLink.y,x,y) + round(obj_ai.enavLink.orbit_angle*10)/10),1,1,round(obj_ai.enavLink.orbit_angle*10)/10,c_white,1)
						}else if object_index = obj_nav{
							draw_sprite_ext(spr_plat,1,x,y,1,1,round(orbit_angle*10)/10,c_white,1)
						}else{
							draw_sprite_ext(sprite_index,image_index,obj_ai.enavLink.x+lengthdir_x(point_distance(x, y, obj_ai.enavLink.x, obj_ai.enavLink.y),point_direction(obj_ai.enavLink.x,obj_ai.enavLink.y,x,y) + round(obj_ai.enavLink.orbit_angle*10)/10),obj_ai.enavLink.y+lengthdir_y(point_distance(x, y, obj_ai.enavLink.x, obj_ai.enavLink.y),point_direction(obj_ai.enavLink.x,obj_ai.enavLink.y,x,y) + round(obj_ai.enavLink.orbit_angle*10)/10),1,1,round(obj_ai.enavLink.orbit_angle*10)/10,c_white,1)
						}
					}else{
						switch(object_index){
							case obj_turret: draw_sprite_ext(sprite_index,image_index,obj_ai.enavLink.x+lengthdir_x(point_distance(x, y, obj_ai.enavLink.x, obj_ai.enavLink.y),point_direction(obj_ai.enavLink.x,obj_ai.enavLink.y,x,y) + round(obj_ai.enavLink.orbit_angle*10)/10),obj_ai.enavLink.y+lengthdir_y(point_distance(x, y, obj_ai.enavLink.x, obj_ai.enavLink.y),point_direction(obj_ai.enavLink.x,obj_ai.enavLink.y,x,y) + round(obj_ai.enavLink.orbit_angle*10)/10),1,1,round(obj_ai.enavLink.orbit_angle*10)/10,c_white,1)
							break
							case obj_turretdown: draw_sprite_ext(sprite_index,image_index,obj_ai.enavLink.x+lengthdir_x(point_distance(x, y, obj_ai.enavLink.x, obj_ai.enavLink.y),point_direction(obj_ai.enavLink.x,obj_ai.enavLink.y,x,y) + round(obj_ai.enavLink.orbit_angle*10)/10),obj_ai.enavLink.y+lengthdir_y(point_distance(x, y, obj_ai.enavLink.x, obj_ai.enavLink.y),point_direction(obj_ai.enavLink.x,obj_ai.enavLink.y,x,y) + round(obj_ai.enavLink.orbit_angle*10)/10),1,1,180+round(obj_ai.enavLink.orbit_angle*10)/10,c_white,1)
							break
							case obj_turretleft: draw_sprite_ext(sprite_index,image_index,obj_ai.enavLink.x+lengthdir_x(point_distance(x, y, obj_ai.enavLink.x, obj_ai.enavLink.y),point_direction(obj_ai.enavLink.x,obj_ai.enavLink.y,x,y) + round(obj_ai.enavLink.orbit_angle*10)/10),obj_ai.enavLink.y+lengthdir_y(point_distance(x, y, obj_ai.enavLink.x, obj_ai.enavLink.y),point_direction(obj_ai.enavLink.x,obj_ai.enavLink.y,x,y) + round(obj_ai.enavLink.orbit_angle*10)/10),1,1,90+round(obj_ai.enavLink.orbit_angle*10)/10,c_white,1)
							break
							case obj_turretright: draw_sprite_ext(sprite_index,image_index,obj_ai.enavLink.x+lengthdir_x(point_distance(x, y, obj_ai.enavLink.x, obj_ai.enavLink.y),point_direction(obj_ai.enavLink.x,obj_ai.enavLink.y,x,y) + round(obj_ai.enavLink.orbit_angle*10)/10),obj_ai.enavLink.y+lengthdir_y(point_distance(x, y, obj_ai.enavLink.x, obj_ai.enavLink.y),point_direction(obj_ai.enavLink.x,obj_ai.enavLink.y,x,y) + round(obj_ai.enavLink.orbit_angle*10)/10),1,1,-90+round(obj_ai.enavLink.orbit_angle*10)/10,c_white,1)
							break
						
						}
					}
				}else{
					ds_list_delete(global.enemyship,other.i)
					break
				}
		    }
		}
	}
}