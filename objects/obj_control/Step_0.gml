/// @description  Particle Background
/*
if room = Enemy{
    //part_system_position(stars,obj_player.x,obj_player.y)
    
    
    //if mouse_check_button_pressed(mb_left){
        part_emitter_region(stars,emitter1,-1000+obj_player.x,1000+obj_player.x,-1000+obj_player.y,1000+obj_player.y,ps_shape_rectangle,0)
        part_emitter_region(stars,emitter2,-1000+obj_player.x,1000+obj_player.x,-1000+obj_player.y,1000+obj_player.y,ps_shape_rectangle,0)
    //}
}


/* */
///Frameskip

//target_framerate = 60 * (original_time/delta_time); // Cap at 60fps

overflow += delta_time - original_time

if (overflow >= original_time){
    draw_enable_drawevent(false);
    overflow = 0
}else{
    draw_enable_drawevent(true);
}



/* */
/*  */
