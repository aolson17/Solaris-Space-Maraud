if rotate = 1{
dir_now := point_direction(orbit.x,orbit.y,x,y);
randomize()
dir_new := (dir_now + random(360) + 360)mod(360);
x := lengthdir_x(radius,dir_new) + orbit.x;
y := lengthdir_y(radius,dir_new) + orbit.y;  
}else{
if distance_to_object(par_ast) = 0 {instance_destroy()}
}

action_snap(40, 40);
