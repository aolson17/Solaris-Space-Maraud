/// @description Save All Block Locations

//argument0 is the name of the ship and is a string
name = argument0


//find open save
savenum = 1
same = 0
while true{
    if file_exists("ship" + string(savenum) + ".ini"){
        ini_open("ship" + string(savenum) + ".ini")
        if name = ini_read_string("Name","Name",""){
            same = 1
            break
        }else{
            savenum ++
        }    
        ini_close()
        
    }else{break}
}


scr_manage_blocks("save",false)


if same = 0{

file_rename("Ship" + string(1 + ds_list_size(global.shipname)) + ".ini","Ship1 temp.ini")

for (var s = 1 + ds_list_size(global.shipname);s >= 0; s --){
    file_rename("ship" + string(s) + ".ini","ship" + string(s + 1) + ".ini")
}

file_rename("Ship1 temp.ini","Ship1.ini")

}


scr_find_saves()


