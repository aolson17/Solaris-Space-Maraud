
stars = part_system_create()

particle1 = part_type_create();
part_type_shape(particle1,pt_shape_disk);
part_type_size(particle1,0.10,0.10,0,0);
part_type_scale(particle1,1,1);
part_type_color1(particle1,16777215);
part_type_alpha3(particle1,0,0.20,0);
part_type_speed(particle1,0,0,0,0);
part_type_direction(particle1,0,359,0,0);
part_type_gravity(particle1,0,270);
part_type_orientation(particle1,0,0,0,0,1);
part_type_blend(particle1,1);
part_type_life(particle1,200,400);

emitter1 = part_emitter_create(stars);
part_emitter_region(stars,emitter1,-1000,1000,-1000,1000,ps_shape_rectangle,0);
part_emitter_stream(stars,emitter1,particle1,1);

particle2 = part_type_create();
part_type_shape(particle2,pt_shape_disk);
part_type_size(particle2,0.10,0.10,0,0);
part_type_scale(particle2,1,1);
part_type_color1(particle2,16777215);
part_type_alpha3(particle2,0,0.60,0);
part_type_speed(particle2,0,0.05,0,0);
part_type_direction(particle2,0,359,0,0);
part_type_gravity(particle2,0,270);
part_type_orientation(particle2,0,0,0,0,1);
part_type_blend(particle2,1);
part_type_life(particle2,60,300);

emitter2 = part_emitter_create(stars);
part_emitter_region(stars,emitter2,-1000,1000,-1000,1000,ps_shape_rectangle,0);
part_emitter_stream(stars,emitter2,particle2,1);


