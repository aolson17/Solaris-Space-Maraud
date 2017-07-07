///scr_col(direction)

collision = 0
object = id

range = 2

dir = argument0

for(j=0;j<=ds_list_size(global.playership);j++){
    with(ds_list_find_value(global.playership,j)){
        if object_index = obj_ai{
			ds_list_delete(global.playership,other.j)
			break
		}
        
		tempx = x
		tempy = y
		tempangle = image_angle
		
		image_angle = navLink.image_angle
        x = navLink.x + lengthdir_x(point_distance(x, y, navLink.x, navLink.y),point_direction(navLink.x,navLink.y,x,y));
	    y = navLink.y + lengthdir_y(point_distance(x, y, navLink.x, navLink.y),point_direction(navLink.x,navLink.y,x,y));
        
		if other.j = ds_list_size(global.playership){
			switch(other.dir){
				case "up":
					if place_meeting(other.object.x,other.object.y-other.range,par_wall){
					    other.collision = 1
					}else{
						other.collision = 0
					}
				break
				case "down":
					if place_meeting(other.object.x,other.object.y+other.range,par_wall){
					    other.collision = 1
					}else{
						other.collision = 0
					}
				break
				case "left":
					if place_meeting(other.object.x-other.range,other.object.y,par_wall){
					    other.collision = 1
					}else{
						other.collision = 0
					}
				break
				case "right":
					if place_meeting(other.object.x+other.range,other.object.y,par_wall){
					    other.collision = 1
					}else{
						other.collision = 0
					}
				break
			}
		}
		
		x = tempx
		y = tempy
		image_angle = tempangle
    }
}







return collision

