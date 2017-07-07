if place_meeting(x,y,par_wall){

show_debug_message("Bad Collision                Random#" + string(random(100)))

xtemp = x
cxplus = 0
while place_meeting(x,y,par_wall){// +x check
    x += .1
    cxplus += .1
    if !place_meeting(x,y,par_wall){
    }
}
x = xtemp
cxminus = 0
while place_meeting(x,y,par_wall){// -x check
    x -= .1
    cxminus += .1
    if !place_meeting(x,y,par_wall){
    }
}
x = xtemp
ytemp = y
cyplus = 0
while place_meeting(x,y,par_wall){// +y check
    y += .1
    cyplus += .1
    if !place_meeting(x,y,par_wall){
    }
}
y = ytemp
cyminus = 0
while place_meeting(x,y,par_wall){// -y check
    y -= .1
    cyminus += .1
    if !place_meeting(x,y,par_wall){
    }
}
y = ytemp

if cxplus < cxminus && cxplus < cyplus && cxplus < cyminus{//cxplus is smallest
    x += cxplus
}else if cxminus < cxplus && cxminus < cyplus && cxminus < cyminus{//cxminus is smallest
    x -= cxminus
}else if cyplus < cyminus && cyplus < cxplus && cyplus < cxminus{//cyplus is smallest
    y += cyplus
}else if cyminus < cyplus && cyminus < cxplus && cyminus < cxminus{//cyminus is smallest
    y -= cyminus
}

}
