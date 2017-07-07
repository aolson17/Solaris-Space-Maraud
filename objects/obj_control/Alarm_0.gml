/// @description  Pseudo Parent System

has_thrusters = 0

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
						if object_is_ancestor(ds_list_find_value(instances,i).object_index,par_thrust){
							other.has_thrusters = 1
						}
                    }
                }
            }
        }
    }
}

//Find position compared to center of ship for rotaion
if has_thrusters != 0{
	par_thrust.alarm[0]=1
}


//reorder list for depth, lower index drawn last

/*
first

par_obj
par_flyablesolid
par_flyable

last
*/


sort_amount = ds_list_size(global.playership)-1


for(i=0;i<=sort_amount;i++){// sort par_obj
	with(ds_list_find_value(global.playership,i)){
        if other.i = 36{show_message("36 about to be dealt with")}
		if object_get_parent(object_index)=par_obj{
				if i = 36{show_message("36 dealt with")}
				
			ds_list_delete(global.playership,other.i)
			ds_list_insert(global.playership,other.sort_amount,id)
				
				
			other.sort_amount--
		}
		
		if object_get_parent(object_index)=par_flyable{
				
				
			ds_list_delete(global.playership,other.i)
			ds_list_insert(global.playership,1,id)
				
				
		}
	}
}
/*
for(i=0;i<=sort_amount;i++){// sort par_flyablesolid
	with(ds_list_find_value(global.playership,i)){
        
		if object_get_parent(object_index)=par_flyablesolid{
			show_debug_message("sorting")
				
				
			ds_list_delete(global.playership,other.i)
			ds_list_insert(global.playership,other.sort_amount,id)
				
				
			other.sort_amount--
		}
	}
}


