//action_move_to(mouse_x, mouse_y );


x = navLink.x+lengthdir_x(point_distance(mouse_x, mouse_y, navLink.x, navLink.y),point_direction(navLink.x,navLink.y,mouse_x,mouse_y) + -round(navLink.orbit_angle*10)/10)
y = navLink.y+lengthdir_y(point_distance(mouse_x, mouse_y, navLink.x, navLink.y),point_direction(navLink.x,navLink.y,mouse_x,mouse_y) + -round(navLink.orbit_angle*10)/10)