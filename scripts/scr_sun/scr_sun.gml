/// @description scr_sun(x,y)
/// @function scr_sun
/// @param x
/// @param y

particle1 = part_type_create();
part_type_shape(particle1,pt_shape_flare);
part_type_size(particle1,1.50,2,0,0);
part_type_scale(particle1,1,1);
part_type_color2(particle1,65535,255);
part_type_alpha1(particle1,1);
part_type_speed(particle1,1.80,2,0,0);
part_type_direction(particle1,0,359,0,0);
part_type_gravity(particle1,0,270);
part_type_orientation(particle1,0,0,0,0,1);
part_type_blend(particle1,1);
part_type_life(particle1,60,60);

emitter1 = part_emitter_create("sun");
part_emitter_region("sun",emitter1,x+(.5*sprite_width),x+(.5*sprite_width),y+(.5*sprite_height),y+(.5*sprite_height),0,0);
part_emitter_stream("sun",emitter1,particle1,20);

