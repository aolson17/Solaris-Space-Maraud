wallSlideParticleSystem = part_system_create()


particle1 = part_type_create();
part_type_shape(particle1,pt_shape_flare);
part_type_size(particle1,0.10,0.10,0,0);
part_type_scale(particle1,1,1);
part_type_color2(particle1,12632256,8421504);
part_type_alpha2(particle1,0.60,0);
part_type_speed(particle1,0.10,0.30,0,0);
part_type_direction(particle1,0,359,0,0);
part_type_gravity(particle1,0,270);
part_type_orientation(particle1,0,0,0,0,1);
part_type_blend(particle1,1);
part_type_life(particle1,20,60);

emitter1 = part_emitter_create(wallSlideParticleSystem);
part_emitter_region(wallSlideParticleSystem,emitter1,scr_rotated(x)-sprite_width/2,scr_rotated(x)-3-sprite_width/2,scr_rotated(y)-sprite_height/2,scr_rotated(y)+sprite_height/2,0,0);
part_emitter_burst(wallSlideParticleSystem,emitter1,particle1,3);
