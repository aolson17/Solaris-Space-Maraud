
for(i=0;i<=ds_list_size(global.playership);i++){
    with(ds_list_find_value(global.playership,i)){
        var dep = depth
        depth = dep - 10
        //draw_rectangle_colour(x-5,y-5,x+5,y+5, c_red, c_red, c_red, c_red, false)
        depth = dep
    }
}

if room!=ShipBuilder{
    with(obj_player.navLink){
        //draw_rectangle_colour(x-5,y-5,x+5,y+5, c_blue, c_red, c_blue, c_red, false)
    }
}

if keyboard_check(vk_tab){
    draw_set_color(c_lime)
    draw_text(mouse_x,mouse_y - 20,string_hash_to_newline("Player Ship Size:" + string(ds_list_size(global.playership))))
    draw_text(mouse_x,mouse_y - 10,string_hash_to_newline("-Player Ship Parts-"))
    for(i=0;i<=ds_list_size(global.playership);i++){
        
        draw_text(mouse_x,mouse_y + 10*i,string_hash_to_newline(string(ds_list_find_value(global.playership,i))))
    }
    draw_text(mouse_x+400,mouse_y - 20,string_hash_to_newline("Enemy Ship Size:" + string(ds_list_size(global.enemyship))))
    draw_text(mouse_x+400,mouse_y - 10,string_hash_to_newline("-Enemy Ship Parts-"))
    for(i=0;i<=ds_list_size(global.enemyship);i++){
        
        draw_text(mouse_x+400,mouse_y + 10*i,string_hash_to_newline(string(ds_list_find_value(global.enemyship,i).object_index)))
    }
}

