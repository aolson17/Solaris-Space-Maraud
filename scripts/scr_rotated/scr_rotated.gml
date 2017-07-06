///scr_rotated(x or y)


if argument0 = x{
	return navLink.x+lengthdir_x(point_distance(x, y, navLink.x, navLink.y),point_direction(navLink.x,navLink.y,x,y) + round(navLink.orbit_angle*10)/10)
}else{
	return navLink.y+lengthdir_y(point_distance(x, y, navLink.x, navLink.y),point_direction(navLink.x,navLink.y,x,y) + round(navLink.orbit_angle*10)/10)
}



