/// @description Move to view

x = obj_viewcontrol.x

if obj_save_mult.active = false{
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
}

if (up) y -= 10;
if (down) y += 10;

///Scroll to veiw more objects

if mouse_wheel_down() {
    y -= 32;
    with(par_con){
        y -= 32;// Move Construction Items
    }
}
if mouse_wheel_up() {
    y += 32;
    with(par_con){
        y += 32;// Move Construction Items
    }
}



///Selected Placement

if keyboard_check(ord("C")) && obj_save_mult.active = false{
    
    if collision_point(mouse_x,mouse_y,par_flyablesolid,true,true) != noone{
        global.selected = collision_point(mouse_x,mouse_y,par_flyablesolid,true,true).object_index
        global.selectedface = global.selected.face
    }else if collision_point(mouse_x,mouse_y,par_flyable,true,true) != noone{
        global.selected = instance_place(mouse_x,mouse_y,par_flyable)
        global.selectedface = global.selected.face
    }else{
        global.selected = instance_place(mouse_x,mouse_y,par_obj)
        global.selectedface = global.selected.face
    }
    
}

if keyboard_check(ord("V")) && obj_save_mult.active = false{
    
    if global.selected != noone{
        rep = instance_create(mouse_x,mouse_y,obj_repselected)
        rep.face = global.selectedface
        
    }
    
}




