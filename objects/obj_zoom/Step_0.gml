//Control follow Camera follow player//For smooth, never choppy camera//
cam_x+=(obj_player.x-cam_x)*.3
cam_y+=(obj_player.y-cam_y)*.3
x+=(cam_x-x)*.2
y+=(cam_y-y)*.2

//toggle Zoom//
if mouse_check_button_pressed(mb_middle){
if zoom_t=0{zoom_t=1}else{zoom_t=0}} //Switch between 0 and 1 for zoom type
if zoom_t=1{zoom_w=320; zoom_h=240;}else{zoom_w=640; zoom_h=480;} //Change amount for views

//Zoom in smoothly
zoom_wi+=(zoom_w-zoom_wi)*.2
zoom_hi+=(zoom_h-zoom_hi)*.2
//Update views on current zoom view
__view_set( e__VW.WView, 0, (zoom_wi*.5)*2 )
__view_set( e__VW.HView, 0, (zoom_hi*.5)*2 )
__view_set( e__VW.HBorder, 0, (zoom_w*.5)*2 )
__view_set( e__VW.VBorder, 0, (zoom_h*.5)*2 )


