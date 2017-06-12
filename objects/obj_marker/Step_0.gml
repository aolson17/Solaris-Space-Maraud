/// @description View

// Allow view to leave room

//Zoom

view = 0

minz = 1
maxz = 8

if mouse_wheel_up() {
    if zoom > minz{
        zoom -= .1
    }
}

if mouse_wheel_down() {
    if zoom < maxz{
        zoom += .1
    }
}

__view_set( e__VW.WView, view, vew * zoom )
__view_set( e__VW.HView, view, veh * zoom )


__view_set( e__VW.XView, 0, x-(vew * zoom/2) );
__view_set( e__VW.YView, 0, y-(veh * zoom/2) );


__view_set( e__VW.Angle, 0, -image_angle )

var __b__;
__b__ = action_if_variable(going, 0, 0);
if __b__
{
action_snap(40, 40);
}
