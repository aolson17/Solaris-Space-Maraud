/// @description scr_manage_blocks("save"  "load" or "clear",newShip boolean)
/// @function scr_manage_blocks
/// @param "save"  "load" or "clear"
/// @param newShip boolean

newShip = argument1//true if new ship

if newShip{//if creating a new ship
    newNav = instance_create(mouse_x,mouse_y,obj_nav)
    newNav.image_angle = obj_player.image_angle
}

var blocknum = 28 // number of types of blocks to be saved
for (j=1;j < blocknum+1;j+=1){
    if j = 1 {type = string("metal"); typed = obj_metal}
    if j = 2 {type = string("wall"); typed = obj_wall}   
    if j = 3 {type = string("glass"); typed = obj_glass}
    if j = 4 {type = string("thrustleft"); typed = obj_thrustleft}
    if j = 5 {type = string("thrustright"); typed = obj_thrustright}
    if j = 6 {type = string("thrustup"); typed = obj_thrustup}
    if j = 7 {type = string("thrustdown"); typed = obj_thrustdown}
    if j = 8 {type = string("door"); typed = obj_door}
    if j = 9 {type = string("plat"); typed = obj_plat}
    if j = 10 {type = string("reactor"); typed = obj_reactor}
    if j = 11 {type = string("turret"); typed = obj_turret}
    if j = 12 {type = string("turretdown"); typed = obj_turretdown}
    if j = 13 {type = string("turretright"); typed = obj_turretright}
    if j = 14 {type = string("turretleft"); typed = obj_turretleft}
    if j = 15 {type = string("life"); typed = obj_life}
    if j = 16 {type = string("bed"); typed = obj_bed}
    if j = 17 {type = string("locker"); typed = obj_locker}
    if j = 18 {type = string("rackleft"); typed = obj_rackleft}
    if j = 19 {type = string("rackright"); typed = obj_rackright}
    if j = 20 {type = string("rackup"); typed = obj_rackup}
    if j = 21 {type = string("rackdown"); typed = obj_rackdown}
    if j = 22 {type = string("oxygen"); typed = obj_gravgen}
    if j = 23 {type = string("block"); typed = obj_block}
    if j = 24 {type = string("half"); typed = obj_half}
    if j = 25 {type = string("stairs1"); typed = obj_stairs}
    if j = 26 {type = string("stairs2"); typed = obj_stairs2}
    if j = 27 {type = string("stairs3"); typed = obj_stairs3}
    if j = 28 {type = string("stairs4"); typed = obj_stairs4}

if argument0 = "load"{// if loading

if room!=ShipBuilder{
    if !newShip{
        for(i=0;i<=ds_list_size(global.playership);i++){
                with(ds_list_find_value(global.playership,i)){
                    if object_index != obj_nav && object_index != obj_player{
                        instance_destroy()
                    }
                }
        }
        newNav = 0//unused variable unless creating new ship
    }
}else{
    if instance_exists(typed) {
        with (other.typed){
            instance_destroy()
        }
    }
}

ini_open("Ship" + string(savenum) + ".ini")

num = ini_read_real("Blocks", string(type + "num"), 0)

for (i=0; i < num;i+= 1) {
        
    inix = ini_read_real("Blocks",string(string(i) + type + " x"), 0)
    iniy = ini_read_real("Blocks",string(string(i) + type + " y"), 0)
    
    if room!=ShipBuilder{
        if !newShip{
            instance_create(inix + obj_player.navLink.x,iniy + obj_player.navLink.y,typed)
        }else{// if creating a new ship
            instance_create(inix + newNav.x,iniy + newNav.y,typed)
        }
    }else{
        instance_create(inix + obj_nav.x,iniy + obj_nav.y,typed)
    }
}
ini_close()
}else if argument0 = "save"{// if saving

for (i=0; i < instance_number(typed);i+= 1) {
    location[i,0] = instance_find(typed,i).x - obj_nav.x
    location[i,1] = instance_find(typed,i).y - obj_nav.y
    
ini_open("Ship" + string(savenum) + ".ini")

ini_write_string("Name", "Name", string(name))

ini_write_real("Blocks", string(string(i) + type + " x"), floor(location[i,0]))
ini_write_real("Blocks", string(string(i) + type + " y"), floor(location[i,1]))

ini_close()

}

ini_open("Ship" + string(savenum) + ".ini")

ini_write_real("Blocks", type + "num", instance_number(typed))

ini_close()

}if argument0 = "clear"{// if clearing
if instance_exists(typed) {
    with (typed){
        instance_destroy()
    }
}

}

}
