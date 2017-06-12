x = mouse_x - 20
y = mouse_y - 20

action_snap(40, 40);



// Target
if mouse_check_button_pressed(mb_left) && going != 1{
    targetx = x + 20
    targety = y + 20
    with(par_path){instance_destroy()}
}


if keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_right){
    going = 1
}



if going = 1 {
with(obj_marker){
// Update variables
going = other.going

tary = other.targety - 20
tarx = other.targetx - 20


    if y != tary{
    
        y += 10*sign(tary - y)
        
    }else if x != tarx{
    
        x += 10*sign(tarx - x)
        
    }
    
    if x = tarx && y = tary{
        going = 0
    }
global.travel = going    
}
going = global.travel

}else {
with(obj_marker){going = other.going}// just update going
}



