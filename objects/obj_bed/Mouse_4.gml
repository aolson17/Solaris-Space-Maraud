scr_create_rep(obj_repbed)

///Lie Down

if room != ShipBuilder{
if global.sleeping = 0 && distance_to_object(obj_player) = 0{

global.sleeping = 1

} else if global.sleeping = 1 && distance_to_object(obj_player) = 0{

global.sleeping = 0

}
}

