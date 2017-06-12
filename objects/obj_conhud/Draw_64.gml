/// @description Draw HUD
xsize = 200
ysize = 60


draw_set_color(make_color_rgb(160,160,160))
draw_rectangle(-50,0,xsize,ysize,false)
draw_set_color(make_color_rgb(130,130,130))
draw_rectangle(-50,ysize - 6,xsize,ysize,false)
draw_rectangle(xsize - 6,0,xsize,ysize,false)

draw_set_color(make_color_rgb(0,0,0))
draw_text(10,20,string_hash_to_newline("Ship Cost: " + add_comma(global.shipcost) + " C"))


