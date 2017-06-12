/// @description scr_find_gui()
/// @function scr_find_gui
// find position in gui
var ViewCenterX = __view_get( e__VW.XView, 0 ) + (__view_get( e__VW.WView, 0 )/2);
var ViewCenterY = __view_get( e__VW.YView, 0 ) + (__view_get( e__VW.HView, 0 )/2);
gZoom = __view_get( e__VW.WPort, 0 ) * __view_get( e__VW.WView, 0 );
var MyDistanceFromCenter = point_distance(ViewCenterX,ViewCenterY,x,y) / gZoom;
var MyDirectionFromCenter = point_direction(ViewCenterX,ViewCenterY,x,y) + __view_get( e__VW.Angle, 0 );
guix = (__view_get( e__VW.WPort, 0 )/2) + lengthdir_x(MyDistanceFromCenter,MyDirectionFromCenter)
guiy = (__view_get( e__VW.HPort, 0 )/2) + lengthdir_y(MyDistanceFromCenter,MyDirectionFromCenter)
