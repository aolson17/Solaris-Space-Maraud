if holding = 1{
    x =mouse_x - 48
    y=mouse_y - 16
    x=round(x/4)*4;//Align to grid 4 by 4
    y=round(y/4)*4;
}



if holding = 1{
    if keyboard_check_pressed(vk_right) {
        instance_change(obj_rackup, true)
    }
    if keyboard_check_pressed(vk_left) {
        instance_change(obj_rackdown, true)
    }
}

///shoot


