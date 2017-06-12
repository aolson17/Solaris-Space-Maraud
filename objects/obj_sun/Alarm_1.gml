/// @description Create Solar System
chance1 = choose(1,1,2,3)// First Ring
if chance1 = 1{
    instance_create(x-ring1,y,obj_planet)
}else if chance1 = 2 {
    instance_create(x-ring1,y,obj_asteroid)
}

chance2 = choose(1,1,2,3)// Second Ring
if chance2 = 1{
    instance_create(x-ring2,y,obj_planet)
}else if chance2 = 2 {
    instance_create(x-ring2,y,obj_asteroid)
}

chance3 = choose(1,1,2,3)// Third Ring
if chance3 = 1{
    instance_create(x-ring3,y,obj_planet)
}else if chance3 = 2 {
    instance_create(x-ring3,y,obj_asteroid)
}

chance4 = choose(1,1,2,3)// Fourth Ring
if chance4 = 1{
    instance_create(x-ring4,y,obj_planet)
}else if chance4 = 2 {
    instance_create(x-ring4,y,obj_asteroid)
}

// Other Orbits
chance12 = choose(1,1,2)// First Ring
if chance12 = 1{
    instance_create(x-ring12,y,obj_planet)
}

chance22 = choose(1,1,2)// Second Ring
if chance22 = 1{
    instance_create(x-ring22,y,obj_planet)
}

chance32 = choose(1,1,2)// Third Ring
if chance32 = 1{
    instance_create(x-ring32,y,obj_planet)
}

chance42 = choose(1,1,2)// Fourth Ring
if chance42 = 1{
    instance_create(x-ring42,y,obj_planet)
}

