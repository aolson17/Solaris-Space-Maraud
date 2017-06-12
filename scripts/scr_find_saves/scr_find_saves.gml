/// @description scr_find_saves()
/// @function scr_find_saves

global.shipname = ds_list_create()
ds_list_clear(global.shipname)


var savenum = 1
while true{
    if file_exists("ship" + string(savenum) + ".ini"){
        ini_open("ship" + string(savenum) + ".ini")
        
        ds_list_add(global.shipname,ini_read_string("Name","Name",""))
        //global.shipname[savenum] = ini_read_string("Name","Name","")
        
        savenum ++
           
        ini_close()
    }else{
        break
    }
}
