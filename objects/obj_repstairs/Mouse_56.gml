/// @description Place Object
if collision_rectangle(obj_viewcontrol.x + __view_get( e__VW.WView, 0 ) * .3,__view_get( e__VW.YView, 0 ),__view_get( e__VW.WView, 0 ) + obj_viewcontrol.x,__view_get( e__VW.HView, 0 ) + obj_viewcontrol.y,object_index,false,false){
collide = 1
}
if collide = 0{
if face = "1"{instance_create(x,y,obj_stairs)}
if face = "3"{instance_create(x,y,obj_stairs3)}
if face = "2"{instance_create(x,y,obj_stairs2)}
if face = "4"{instance_create(x,y,obj_stairs4)}
}

instance_destroy()
