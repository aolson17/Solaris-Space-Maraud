/// @description  Pseudo Parent System

obj_player.navLink = instance_nearest(obj_player.x,obj_player.y,obj_nav)

//global.playership = ds_list_create()
ds_list_clear(global.playership)

//ds_list_add(global.playership, obj_nav.instance_id)
ds_list_add(global.playership, instance_id_get( 0 ))

for(i=1;i<=ds_list_size(global.playership);i++){
    with(ds_list_find_value(global.playership,i)){
        instances = collision_rectangle_list(x-sprite_width,y-sprite_height,x+sprite_width,y+sprite_height,all,false,true)
        if instances != noone{
            for(i=0;i<=ds_list_size(instances);i++){
                if ds_list_find_index(global.playership, ds_list_find_value(instances,i)) = -1{
                    if object_is_ancestor(ds_list_find_value(instances,i).object_index,par_flyablesolid) || object_is_ancestor(ds_list_find_value(instances,i).object_index,par_flyable){
                        ds_list_add(global.playership, ds_list_find_value(instances,i))
                    }
                }
            }
        }
    }
}

//Find position compared to center of ship for rotaion
par_thrust.alarm[0]=1




