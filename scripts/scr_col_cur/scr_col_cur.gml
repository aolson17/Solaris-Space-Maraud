///scr_col_ext(x offset,y offset)

collision = 0

offset_x = argument0
offset_y = argument1

has_moved_player = 0
for(i=0;i<=ds_list_size(global.playership);i++){
    with(ds_list_find_value(global.playership,i)){
        if object_index = obj_ai{
			ds_list_delete(global.playership,other.i)
			break
		}
        
		tempx = x
		tempy = y
		
		
        x = navLink.x + lengthdir_x(point_distance(x, y, navLink.x, navLink.y),point_direction(navLink.x,navLink.y,x,y));
	    y = navLink.y + lengthdir_y(point_distance(x, y, navLink.x, navLink.y),point_direction(navLink.x,navLink.y,x,y));
        
		
		
		if dir = "horizontal"{
			if place_meeting(x+other.offset_x,y+other.offset_y,par_wall){
				other.collision = 1
			}else{
				other.collision = 0
			}
		}else{
			if place_meeting(x+other.offset_x,y+other.offset_y,par_wall){
				other.collision = 1
			}else{
				other.collision = 0
			}
		}
		
		
		
		
		x = tempx
		y = tempy
    }
}







return collision

