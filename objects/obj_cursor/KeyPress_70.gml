var __b__;
__b__ = action_if_variable(room, ShipBuilder, 0);
if __b__
{
{
__b__ = action_if_variable(obj_save_mult.active, false, 0);
if __b__
{
///Fullscreen
if window_get_fullscreen(){
    window_set_fullscreen(false);
}else{
    window_set_fullscreen(true);
}  

}
}
}
else
{
__b__ = action_if_variable(room, ShipBuilder, 0);
if !__b__
{
///Fullscreen
if window_get_fullscreen(){
    window_set_fullscreen(false);
}else{
    window_set_fullscreen(true);
}  

}
}
