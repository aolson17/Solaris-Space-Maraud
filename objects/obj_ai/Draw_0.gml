if enavLink != noone{
    draw_rectangle_colour(enavLink.x-8,enavLink.y-8,enavLink.x+8,enavLink.y+8, c_yellow, c_yellow, c_yellow, c_yellow, false)
}    for(i=0;i<=ds_list_size(global.enemyship);i++){
        with(ds_list_find_value(global.enemyship,i)){
            draw_rectangle_colour(x-5,y-5,x+5,y+5, c_red, c_red, c_red, c_red, false)
        }
    }
//}

for(i=0;i<=ds_list_size(global.playership);i++){
        with(ds_list_find_value(global.playership,i)){
            draw_rectangle_colour(x-5,y-5,x+1,y+5, c_blue, c_blue, c_blue, c_blue, false)
        }
    }

