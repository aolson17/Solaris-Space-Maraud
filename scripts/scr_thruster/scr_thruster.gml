Sname = part_system_create()


particle1 = part_type_create();
part_type_sprite(particle1,spr_thrust,0,1,1);
part_type_size(particle1,1,10,0,0);
part_type_scale(particle1,0.80,0.80);
part_type_colour2(particle1,16777215,8454143);
part_type_alpha3(particle1,0.10,0,0);
part_type_speed(particle1,0,0.50,0,0);
if object_index = obj_thrustleft{part_type_direction(particle1,ang,ang,0,10);}
if object_index = obj_thrustright{part_type_direction(particle1,ang - 180,ang - 180,0,10);}
if object_index = obj_thrustup{part_type_direction(particle1,ang - 90,ang - 90,0,10);}
if object_index = obj_thrustdown{part_type_direction(particle1,ang + 90,ang + 90,0,10);}
part_type_gravity(particle1,0,270);
part_type_orientation(particle1,0,1,0,0,1);
part_type_blend(particle1,1);
part_type_life(particle1,10,10);

part_system_depth(Sname,-999)
emitter1 = part_emitter_create(Sname);
part_emitter_region(Sname,emitter1,scr_rotated(x)-10,scr_rotated(x)+10,scr_rotated(y)-10,scr_rotated(y)+10,ps_shape_ellipse,1);
part_emitter_burst(Sname,emitter1,particle1,7);

//part_system_destroy(Sname)
