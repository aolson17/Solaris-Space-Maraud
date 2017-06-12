/// @description /This is the important part here. This uses the new application_surface!
draw_surface_ext(application_surface,(window_get_width()/2)-((__view_get( e__VW.WView, 0 )*scale)/2),(window_get_height()/2)-((__view_get( e__VW.HView, 0 )*scale)/2) ,scale,scale,0,c_white,1)


///Magical Interpolation by tizzio on the GMC

//turn off texture interpolation
texture_set_interpolation(false);

if global.interpolation=true
{
if window_get_fullscreen()
    {
    //display size
    screen_w = display_get_width();
    screen_h = display_get_height();
    }
        else
        {
        //display size
        screen_w = window_get_width();
        screen_h = window_get_height();
        }
  
//recreate the surface if not exists
if(!surface_exists(screen_sur))
    screen_sur = surface_create(app_w * app_xscal, app_h * app_yscal);


//render on the upscaled surface
surface_set_target(screen_sur);
draw_surface_ext(application_surface, 0, 0, app_xscal, app_yscal, 0, -1, 1);
surface_reset_target();

//draw the big surface stretched fit the screen
texture_set_interpolation(true);
draw_surface_stretched(screen_sur, 0, 0, screen_w, screen_h);
}

