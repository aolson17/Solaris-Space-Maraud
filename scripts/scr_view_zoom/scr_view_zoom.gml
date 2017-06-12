/// @description scr_view_zoom(amount, view)
/// @function scr_view_zoom
/// @param amount
/// @param  view
var amount = 1+argument[0];
var view = argument[1];

// Limit zoom amount
if (__view_get( e__VW.WView, view )<=64 && amount < 1) exit;
if (__view_get( e__VW.WView, view )>=1280 && amount > 1) exit;

// Get offset
var offx = abs(__view_get( e__VW.WView, view )*amount - __view_get( e__VW.WView, view ));
var offx = abs(__view_get( e__VW.HView, view )*amount - __view_get( e__VW.HView, view ));

// Scale view
__view_set( e__VW.WView, view, __view_get( e__VW.WView, view ) * (amount) );
__view_set( e__VW.HView, view, __view_get( e__VW.HView, view ) * (amount) );

// Adjust view position
if (amount < 1) {
    __view_set( e__VW.XView, view, __view_get( e__VW.XView, view ) + (offx/2) );
    __view_set( e__VW.YView, view, __view_get( e__VW.YView, view ) + (offy/2) );
} else if (amount > 1) {
    __view_set( e__VW.XView, view, __view_get( e__VW.XView, view ) - (offx/2) );
    __view_set( e__VW.YView, view, __view_get( e__VW.YView, view ) - (offy/2) );
}


