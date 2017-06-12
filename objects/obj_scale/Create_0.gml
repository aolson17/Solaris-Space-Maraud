//Disable the Application Surface
application_surface_draw_enable(false);
surface_resize(application_surface,__view_get( e__VW.WView, 0 ),__view_get( e__VW.HView, 0 ))

///set initial scale
//scale=1
scale = __view_get( e__VW.WPort, 0 )/__view_get( e__VW.WView, 0 )
if !window_get_fullscreen()
{
window_set_size(__view_get( e__VW.WView, 0 )*scale,__view_get( e__VW.HView, 0 )*scale)
}

///New Smart-Interpolation Feature
global.interpolation=false

///Magical Interpolation by tizzio on the GMC

//disable automatic application surface draw
application_surface_draw_enable(false);

//display size
screen_w = display_get_width();
screen_h = display_get_height();

//actual application surface size
app_w = __view_get( e__VW.WView, 0 )
app_h = __view_get( e__VW.HView, 0 )

//rounded scalint for pixel perfect
app_xscal = ceil(screen_w / app_w);
app_yscal = ceil(screen_h / app_h);

//up-scaled surface 
screen_sur = surface_create(app_w * app_xscal, app_h * app_yscal);


