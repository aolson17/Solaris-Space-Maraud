/// @description Place Object
if collision_rectangle(obj_viewcontrol.x + __view_get( e__VW.WView, 0 ) * .3,__view_get( e__VW.YView, 0 ),__view_get( e__VW.WView, 0 ) + obj_viewcontrol.x,__view_get( e__VW.HView, 0 ) + obj_viewcontrol.y,object_index,false,false){
collide = 1
}
if collide = 0{
if face = "up"{instance_create(x,y,obj_thrustup)}
if face = "down"{instance_create(x,y,obj_thrustdown)}
if face = "left"{instance_create(x,y,obj_thrustleft)}
if face = "right"{instance_create(x,y,obj_thrustright)}
}

instance_destroy()

