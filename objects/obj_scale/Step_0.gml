scaleprevious=scale
///Picking Scales and Fullscreen Toggle
if keyboard_check_pressed(ord("0"))
{
/////Toggle Fullscreen
    if window_get_fullscreen()
    {
        window_set_fullscreen(false)
        window_set_size(__view_get( e__VW.WView, 0 )*scale,__view_get( e__VW.HView, 0 )*scale)
        }
        else
        {
         window_set_fullscreen(true)
     }
      window_set_size(__view_get( e__VW.WView, 0 )*scale,__view_get( e__VW.HView, 0 )*scale)
}
//New Smart-Interpolation by Tizzy
if keyboard_check_pressed(ord("9"))
{
window_set_fullscreen(true)
global.interpolation=true
}
////Scales 1 through 5 below
/*if keyboard_check_pressed(ord("1"))
{
scale=1;
global.interpolation=false
if !window_get_fullscreen()
{
//window_set_size(view_wview*scale,view_hview*scale)
scale = view_wport/view_wview

window_set_size(view_wview*scale,view_hview*scale)
}
}*/

/*if keyboard_check_pressed(ord("2"))
{
scale=2;
global.interpolation=false
if !window_get_fullscreen()
{
window_set_size(view_wview*scale,view_hview*scale)
}
}

if keyboard_check_pressed(ord("3"))
{
scale=3;
global.interpolation=false
if !window_get_fullscreen()
{
window_set_size(view_wview*scale,view_hview*scale)
}
}

if keyboard_check_pressed(ord("4"))
{
scale=4;
global.interpolation=false
if !window_get_fullscreen()
{
window_set_size(view_wview*scale,view_hview*scale)
}
}

if keyboard_check_pressed(ord("5"))
{
scale=5;
global.interpolation=false
if !window_get_fullscreen()
{
window_set_size(view_wview*scale,view_hview*scale)
}
}

if keyboard_check_pressed(ord("6"))
{
scale=6;
global.interpolation=false
if !window_get_fullscreen()
{
window_set_size(view_wview*scale,view_hview*scale)
}
}*/
if scale!=scaleprevious
{
window_set_size(__view_get( e__VW.WView, 0 )*scale,__view_get( e__VW.HView, 0 )*scale)
}

/* */
/*  */
