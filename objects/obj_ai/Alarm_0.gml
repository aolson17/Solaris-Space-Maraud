/// @description  Pseudo Parent System

range = 40

enavLink = instance_nearest(mouse_x,mouse_y,obj_nav)

ds_list_clear(global.enemyship)

ds_list_add(global.enemyship, enavLink)

for(i=0;i<=ds_list_size(global.enemyship);i++){
    if ds_list_find_value(global.enemyship,i) = 0{
        ds_list_delete(global.enemyship, i)
    }
    
    
}


for(i=0;i<=ds_list_size(global.enemyship);i++){
    with(ds_list_find_value(global.enemyship,i)){
        instances = collision_rectangle_list(x-other.range,y-other.range,x+other.range,y+other.range,all,false,true)
        if instances != noone{
            for(i=0;i<=ds_list_size(instances);i++){
                if ds_list_find_index(global.enemyship, ds_list_find_value(instances,i)) = -1{// if not already in enemyship
                    if ds_list_find_index(global.playership, ds_list_find_value(instances,i)) = -1{// if not in playership
                        if object_is_ancestor(ds_list_find_value(instances,i).object_index,par_flyablesolid) || object_is_ancestor(ds_list_find_value(instances,i).object_index,par_flyable){
                            if ds_list_find_value(instances,i).object_index != obj_player{// if not the player
                                ds_list_add(global.enemyship, ds_list_find_value(instances,i))
                            }
                        }
                    }
                }
            }
        }
    }
}

//Find position compared to center of ship for rotaion
par_thrust.alarm[0]=1

show_debug_message("Size = " + string(ds_list_size(global.enemyship)))
for(i=1;i<=ds_list_size(global.enemyship);i++){
    show_debug_message("Includes " + string(ds_list_find_value(global.enemyship,i).object_index))
}


