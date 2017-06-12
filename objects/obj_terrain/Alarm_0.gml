if global.numb  = 0{
instance_create(x,y - 192,obj_player)
instance_create(x,y - 160,obj_nav)
instance_create(x,y,obj_dirts)
instance_create(x - 32,y,obj_fragleft)
instance_create(x + 32,y,obj_fragright)

instance_create(x,y,obj_dirts)
instance_create(x,y + 32,obj_dirts)
instance_create(x,y + 64,obj_dirts)
instance_create(x,y + 96,obj_dirts)
instance_create(x,y + 128,obj_dirts)
instance_create(x,y + 160,obj_stones)
for (i=0;i<10;i++){
    instance_create(x,y + 160+32*i,obj_stones)
}



}else {
if global.lr[global.numb-1] = "left"{
instance_create(room_width - 32,global.tall[global.numb - 1] - 96,obj_player)
instance_create(room_width - 32,global.tall[global.numb - 1],obj_fragleft)
instance_create(room_width,global.tall[global.numb - 1],obj_fragright)
}
if global.lr[global.numb-1] = "right"{
instance_create(0 + 32,global.tall[global.numb - 1] - 96,obj_player)
instance_create(0 - 32,global.tall[global.numb - 1],obj_fragleft)
instance_create(0,global.tall[global.numb - 1],obj_fragright)
}

}




instance_destroy()

