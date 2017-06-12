/// @description scr_invsprite(inventorynumber)
/// @function scr_invsprite
/// @param inventorynumber

if global.inv[argument0,1] = 0 {global.inv[argument0,0] = -1}
if global.inv[argument0,0] = -1 && object_get_name(object_index) != "obj_inv_locker"{sprite_index = spr_inv}
else if global.inv[argument0,0] = -1{sprite_index = spr_inv_locker}

// change sprite to each item
if global.inv[argument0,0] = 0 {sprite_index = spr_inv_scrap}
if global.inv[argument0,0] = 1 {sprite_index = spr_inv_gold}
if global.inv[argument0,0] = 2 {sprite_index = spr_inv_platinum}
if global.inv[argument0,0] = 3 {sprite_index = spr_inv_mis}



if global.inv[argument0,1] != 0 {image_index = global.inv[argument0,1] - 1}
