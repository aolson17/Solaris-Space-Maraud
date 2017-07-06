///scr_col_ext(x offset,y offset)

collision = 0
object = id

offset_x = argument0
offset_y = argument1

for(j=0;j<=ds_list_size(global.playership);j++){
    with(ds_list_find_value(global.playership,j)){
        if object_index = obj_ai{
			ds_list_delete(global.playership,other.j)
			break
		}
        
		tempx = x
		tempy = y
		
		
        x = navLink.x + lengthdir_x(point_distance(x, y, navLink.x, navLink.y),point_direction(navLink.x,navLink.y,x,y));
	    y = navLink.y + lengthdir_y(point_distance(x, y, navLink.x, navLink.y),point_direction(navLink.x,navLink.y,x,y));
        
		
		if other.j = ds_list_size(global.playership){
			if place_meeting(other.object.x+other.offset_x,other.object.y+other.offset_y,par_wall){
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

