draw_set_color(make_color_rgb(160,160,160))
draw_rectangle(obj_viewcontrol.x + __view_get( e__VW.WView, 0 ) * .3,__view_get( e__VW.YView, 0 ),__view_get( e__VW.WView, 0 ) + obj_viewcontrol.x,__view_get( e__VW.HView, 0 ) + obj_viewcontrol.y,false)
draw_set_color(make_color_rgb(130,130,130))
draw_rectangle(obj_viewcontrol.x + __view_get( e__VW.WView, 0 ) * .3 - 8,__view_get( e__VW.YView, 0 ),obj_viewcontrol.x + __view_get( e__VW.WView, 0 ) * .3,__view_get( e__VW.HView, 0 ) + obj_viewcontrol.y,false)



//draw_rectangle(obj_viewcontrol.x + view_wview[0] * .3,0,view_wview[0] + obj_viewcontrol.x,view_hview[0] + obj_viewcontrol.y,true)

