Sname = part_system_create()


particle1 = part_type_create();
part_type_shape(particle1,pt_shape_line);
//part_type_sprite(particle1,spr_static,0,1,1);
part_type_size(particle1,.1,.1,0,0);
part_type_scale(particle1,1,1);
part_type_color1(particle1,c_yellow);
part_type_alpha3(particle1,1,0.4,0);
part_type_speed(particle1,1,4,0,0);
part_type_direction(particle1,0,359,0,2);
part_type_gravity(particle1,0.50,image_angle - 90);
part_type_orientation(particle1,image_angle,image_angle,0,0,1);
part_type_blend(particle1,1);
part_type_life(particle1,5,10);

part_system_depth(Sname,5)
emitter1 = part_emitter_create(Sname);
part_emitter_region(Sname,emitter1,x-lengthdir_x(sprite_width/3,-image_angle),x+lengthdir_x(sprite_width/3,image_angle),y+lengthdir_y(sprite_height/2,image_angle-90),y-lengthdir_y(sprite_height/2,image_angle-90),ps_shape_ellipse,0);
part_emitter_burst(Sname,emitter1,particle1,10);

//part_system_destroy(Sname)
