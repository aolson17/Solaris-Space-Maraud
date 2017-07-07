/// @description General

math_set_epsilon(0.000000001)

global.tgm = -1

face = 1
loaded = ""
slot = ""
global.inship = 0
global.loading = 0
image_speed = .3
//image_speed = 10
start_x = x
start_y = y
global.sleeping = 0
inventory = 0
grav = 0.9;//.15
hsp = 0;
vsp = 0;
jumpspeed = 18;//3.6
movespeed = 5.5;//1.2
cury = 0
curx = 0

idealx = 0
idealy = 0
idealr = 0
pdis = 20
pang = 90
a = point_distance(x, y, obj_nav.x, obj_nav.y)
oC = 90 - point_direction(obj_nav.x,obj_nav.y,x,y)
b = 0//distance moved

//Zoom Variables
zoom = 1
vew = __view_get( e__VW.WView, 0 )
veh = __view_get( e__VW.HView, 0 )
//Parallax Variables
vex = __view_get( e__VW.XView, 0 )
vey = __view_get( e__VW.YView, 0 )

event_inherited()
//Deactivate Regions
//alarm[0] = 30

obj_player.navLink = instance_nearest(x,y,obj_nav)

instance_create(x,y + 160,obj_inv_1)
instance_create(x - 96,y + 160,obj_inv_2)
instance_create(x- 192,y + 160,obj_inv_3)
instance_create(x+ 96,y + 160,obj_inv_4)
instance_create(x+ 192,y + 160,obj_inv_5)
instance_create(mouse_x,mouse_y,obj_invhold)

///Deactivation

if room = Land{

alarm[0] = 60

}

///Initiate Arrays

for (i = 500 + instance_number(obj_locker) + instance_number(obj_lockers); i >= 0; i -= 1){

global.inv[i,0] = -1
global.inv[i,1] = 0

}

start_x = x
start_y = y
hsp = 0
vsp = 0
cury = 0
curx = 0
crouch = 0

jump = 0
crouchJumpReady = 0

force = 0



