/// @description scr_loadship_mult(name,new? boolean)
/// @function scr_loadship_mult
/// @param name
/// @param new? boolean

alarm[1] = 10
global.loading = 1

///Load All Block Locations

//argument0 is the name of the ship and is a string
name = argument0

newShip = argument1//true if new ship

//find correct save
savenum = 1
while true{
    if file_exists("ship" + string(savenum) + ".ini"){
        ini_open("ship" + string(savenum) + ".ini")
        if name = ini_read_string("Name","Name",""){
            break
        }else{
            savenum ++
        }    
        ini_close()
        
    }else{
        return 0
    }
}


scr_manage_blocks("load",newShip)


// Assign each locker a number
for (i = 0;i < instance_number(obj_locker);i++){
number = i + 6
with(instance_find(obj_locker, i)){
    invnum = other.number
}
}
// Assign each missile rack a number
for (i = 0;i < instance_number(par_rack);i++){
number = i + 6 + instance_number(par_rack)
with(instance_find(par_rack, i)){
    invnum = other.number
}
}
// Destroy Door Collisons
with (obj_doorcol){instance_destroy()}