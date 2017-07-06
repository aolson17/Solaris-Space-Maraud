///scr_col(direction)

collision = 0

dir = argument0

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
        
		
		switch(dir){
			case "up":
				if place_meeting(x,y-1,par_wall){
				    collision = 1
				}else{
					collision = 0
				}
			break
			case "down":
				if place_meeting(x,y+1,par_wall){
				    collision = 1
				}else{
					collision = 0
				}
			break
			case "left":
				if place_meeting(x-1,y,par_wall){
				    collision = 1
				}else{
					collision = 0
				}
			break
			case "right":
				if place_meeting(x+1,y,par_wall){
				    collision = 1
				}else{
					collision = 0
				}
			break
		}
		
		
		x = tempx
		y = tempy
    }
}







return collision

