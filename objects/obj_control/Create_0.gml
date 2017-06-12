/// @description  Pseudo Parent System

global.playership = ds_list_create()



///Frameskip

original_time = 0
original_time1 = 0
original_time2 = 0
original_time3 = 0
original_time4 = 0
original_time5 = 0
alarm[1] = 2
target_framerate = 60 * (original_time/delta_time); // Cap at 60fps
overflow = 0



/// Particle Background
/*
if room = Enemy{
    scr_stars()
}


/* */
/*  */
