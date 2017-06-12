/// @description  Load Ships 1 2 and 3

if keyboard_check(ord("1")){
    scr_loadship_mult(ds_list_find_value(global.shipname,0),false)
}
if keyboard_check(ord("2")){
    scr_loadship_mult(ds_list_find_value(global.shipname,1),false)
}
if keyboard_check(ord("3")){
    scr_loadship_mult(ds_list_find_value(global.shipname,2),false)
}

