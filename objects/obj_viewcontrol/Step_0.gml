/// @description Move View
var view = 0;
if obj_save_mult.active = false{
up = keyboard_check(ord("W"));
left = keyboard_check(ord("A"));
down = keyboard_check(ord("S"));
right = keyboard_check(ord("D"));
}

var amount = __view_get( e__VW.WView, view )/100;

if (up) y -= 10;
if (right) x += 10;
if (down) y += 10;
if (left) x -= 10;

with(par_con){// Move Construction Items
    if (other.up) y -= 10;
    if (other.right) x += 10;
    if (other.down) y += 10;
    if (other.left) x -= 10;
}


if !keyboard_check(ord("B")) {
__background_set( e__BG.X, 0, __view_get( e__VW.XView, 0 ) * .4 )
__background_set( e__BG.X, 1, __view_get( e__VW.XView, 0 ) * .2 )

__background_set( e__BG.Y, 0, __view_get( e__VW.YView, 0 ) * .4 )
__background_set( e__BG.Y, 1, __view_get( e__VW.YView, 0 ) * .2 )
}


//Allow View to leave room
__view_set( e__VW.XView, 0, x-(__view_get( e__VW.WView, 0 )/2) );
__view_set( e__VW.YView, 0, y-(__view_get( e__VW.HView, 0 )/2) ); 

// Limit to prevent NaN issue with dividing object price dividing by too small of a number
if room = ShipBuilder{
if x < -31000{x = -31000}
if y > 33000{y = 33000}

if x > 31000{x = 31000}
if y < -33000{y = -33000}
}



