scr_static()

if spe < 200 {spe = 200}
if spe > 400 {spe = 400}

randomize()
spe += choose(-20,-10,-5,5,10,20)

alarm[0] = spe


