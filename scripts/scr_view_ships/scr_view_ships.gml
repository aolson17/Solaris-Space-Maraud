/// @description scr_view_ships()
/// @function scr_view_ships

    //draw_text(x - 35, y - 20, string(ds_list_size(global.shipname)))


for (var i = ds_list_size(global.shipname); i > 0; i--;){
    
    draw_set_color(c_black)
    
    if string(ds_list_find_value(global.shipname,(ds_list_size(global.shipname) - i))) = ""{
        draw_text(x + 10, y + 30 * (1 + ds_list_size(global.shipname) - i),string_hash_to_newline("Ship" + string(ds_list_size(global.shipname) - i)))
    }else{
        draw_text(x + 10, y + 30 * (1 + ds_list_size(global.shipname) - i),string_hash_to_newline(string(ds_list_find_value(global.shipname,(ds_list_size(global.shipname) - i)))))
    }
    
    
    draw_set_color(c_blue)// load button
    if mouse_x >= x - 37 && mouse_x <= x + 7 && mouse_y >= y + 30 * (1 + ds_list_size(global.shipname) - i) - 2 && mouse_y <= y + 30 * (1 + ds_list_size(global.shipname) - i) + 16{
        draw_set_alpha(.6)
    }else{
        draw_set_alpha(.3)
    }
    draw_rectangle(x - 37,y + 30 * (1 + ds_list_size(global.shipname) - i) - 2,x + 7, y + 30 * (1 + ds_list_size(global.shipname) - i) + 16, false)
    draw_set_alpha(1)
    draw_set_color(c_black)
    if (1 + ds_list_size(global.shipname) - i) = 1{
        draw_text(x - 41, y + 30 * (1 + ds_list_size(global.shipname) - i) - 1, string_hash_to_newline("1"))
    }else if (1 + ds_list_size(global.shipname) - i) = 2{
        draw_text(x - 42, y + 30 * (1 + ds_list_size(global.shipname) - i) - 1, string_hash_to_newline("2"))
    }else if (1 + ds_list_size(global.shipname) - i) = 3{
        draw_text(x - 42, y + 30 * (1 + ds_list_size(global.shipname) - i) - 1, string_hash_to_newline("3"))
    }
    draw_text(x - 35, y + 30 * (1 + ds_list_size(global.shipname) - i), string_hash_to_newline("Load"))
    
    
    draw_set_color(c_red)// delete button
    if mouse_x >= x + 86 && mouse_x <= x + 144 && mouse_y >= y + 30 * (1 + ds_list_size(global.shipname) - i) - 2 && mouse_y <= y + 30 * (1 + ds_list_size(global.shipname) - i) + 16{
        draw_set_alpha(.6)
    }else{
        draw_set_alpha(.3)
    }
    draw_rectangle(x + 86,y + 30 * (1 + ds_list_size(global.shipname) - i) - 2,x + 144, y + 30 * (1 + ds_list_size(global.shipname) - i) + 16, false)
    draw_set_alpha(1)
    draw_set_color(c_black)
    draw_text(x + 87, y + 30 * (1 + ds_list_size(global.shipname) - i), string_hash_to_newline("Delete"))
    
}



if mouse_check_button_pressed(mb_left) && device_mouse_x_to_gui(0) > display_get_gui_width()/1.5{
    
    for (var i = ds_list_size(global.shipname); i > 0; i--;){
        
        // load button
        if mouse_x >= x - 37 && mouse_x <= x + 7 && mouse_y >= y + 30 * (1 + ds_list_size(global.shipname) - i) - 2 && mouse_y <= y + 30 * (1 + ds_list_size(global.shipname) - i) + 16{
            scr_loadship_mult(ds_list_find_value(global.shipname,(ds_list_size(global.shipname) - i)),false)
            
            file_rename("Ship" + string(1 + ds_list_size(global.shipname) - i) + ".ini","Ship1 temp.ini")
            
            for (var s = 1 + ds_list_size(global.shipname) - i;s >= 0; s --){
                file_rename("ship" + string(s) + ".ini","ship" + string(s + 1) + ".ini")
            }
            
            file_rename("Ship1 temp.ini","Ship1.ini")
            
            
            scr_find_saves()
            break
        }
        
        // delete button
        if mouse_x >= x + 86 && mouse_x <= x + 144 && mouse_y >= y + 30 * (1 + ds_list_size(global.shipname) - i) - 2 && mouse_y <= y + 30 * (1 + ds_list_size(global.shipname) - i) + 16{
            
            file_delete("Ship" + string(1 + ds_list_size(global.shipname) - i) + ".ini")
            
            for (var s = 1 + ds_list_size(global.shipname) - i;s <= ds_list_size(global.shipname); s ++){
                file_rename("ship" + string(s) + ".ini","Ship" + string(s - 1) + ".ini")
            }
            
            
            
            scr_find_saves()
            break
            
            
        }
    }
    
}

if mouse_check_button(mb_middle){scr_find_saves()}



