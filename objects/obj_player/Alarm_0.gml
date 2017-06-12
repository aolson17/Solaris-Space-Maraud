/// @description Deactivate/Activate

instance_deactivate_region(__view_get( e__VW.XView, 0 ) - 70, __view_get( e__VW.YView, 0 ) - 12, __view_get( e__VW.WView, 0 ) + 170, __view_get( e__VW.HView, 0 ) + 70,false,true)
instance_activate_region(__view_get( e__VW.XView, 0 ) - 70, __view_get( e__VW.YView, 0 ) - 12, __view_get( e__VW.WView, 0 ) + 170, __view_get( e__VW.HView, 0 ) + 70,true)

instance_activate_object(obj_cursor)
instance_activate_object(par_generation)
instance_activate_object(par_flyable)
instance_activate_object(par_flyablesolid)
instance_activate_object(obj_scale)
alarm[0] = 15

