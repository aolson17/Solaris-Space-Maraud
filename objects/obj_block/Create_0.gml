if room = ShipBuilder && global.loading = 0 && keyboard_check(vk_shift){
    x=round(x/16)*16 - 8;//Align to grid 32 by 32
    y=round(y/16)*16 - 8;
}else if room = ShipBuilder && global.loading = 0{
    x=round(x/4)*4;//Align to grid 4 by 4
    y=round(y/4)*4;
}




image_speed = 0
event_inherited()

