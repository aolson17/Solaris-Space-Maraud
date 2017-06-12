/// @description scr_create_rep(rep object)
/// @function scr_create_rep
/// @param rep object
var created = 0
if room = ShipBuilder && device_mouse_x_to_gui(0) < 4/5 * display_get_gui_width(){
if !keyboard_check(ord("V")){
instance_create(x,y,argument0);created = 1
}else{
global.selected = argument0
global.selectedface = face
}
if !keyboard_check(ord("C")) && !keyboard_check(ord("V")){instance_destroy()}
}
return created
