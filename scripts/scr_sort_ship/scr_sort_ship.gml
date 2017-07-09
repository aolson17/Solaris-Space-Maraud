///scr_sort_ship(ship ds_list)

ship_array = argument0

//reorder list for depth, lower index drawn last

/*
first

par_obj
par_flyablesolid
par_flyable

last
*/


sort_amount = ds_list_size(ship_array)-1


for(i=0;i<=sort_amount;i++){// sort par_obj
	with(ds_list_find_value(ship_array,i)){
        //if other.i = 36{show_message("36 about to be dealt with")}
		if object_get_parent(object_index)=par_obj{
				//if i = 36{show_message("36 dealt with")}
				
			ds_list_delete(other.ship_array,other.i)
			ds_list_insert(other.ship_array,other.sort_amount,id)
			other.i-=2
			
			other.sort_amount--
		}
		
		
		
		if object_get_parent(object_index)=par_flyable{
				
				
			ds_list_delete(other.ship_array,other.i)
			ds_list_insert(other.ship_array,1,id)
			other.i-=2
				
		}
		
		
	}
}

for(i=0;i<=sort_amount;i++){// sort par_flyablesolid
	with(ds_list_find_value(other.ship_array,i)){
        
		if object_get_parent(object_index)=par_flyablesolid{
				
				
			ds_list_delete(other.ship_array,other.i)
			ds_list_insert(other.ship_array,other.sort_amount,id)
			other.i-=2
			
			other.sort_amount--
		}
	}
}



