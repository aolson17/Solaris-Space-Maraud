

if room != ShipBuilder {


// find position compared to player with rotation
adjx = lengthdir_x(point_distance(obj_player.x,obj_player.y,x,y),point_direction(obj_player.x,obj_player.y,x,y) - image_angle)
adjy = lengthdir_y(point_distance(obj_player.x,obj_player.y,x,y),point_direction(obj_player.x,obj_player.y,x,y) - image_angle)



if adjx <= 48 && adjx >= -48 && adjy <= 32 && adjy >= -32{
        image_speed = quickness
    if round(image_index) = 7 || round(image_index) = 8 || round(image_index) = 9{image_speed = 0}
}else {
    image_speed = -quickness
    if  round(image_index) = 0{image_speed = 0}
}
/*
if (round(image_index) != 10 || round(image_index) != 11 || round(image_index) != 12)&& opened = 1{
    opened = 0
    instance_create(x,y,obj_doorcol)
}else if (round(image_index) = 10 || round(image_index) = 11 || round(image_index) = 12) && opened = 0{

}*/

}

