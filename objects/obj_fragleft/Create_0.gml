action_snap(32, 32);
ascend = global.ascend * 32
instance_create(x,y,obj_topdirts)
/*instance_create(x,y + 6,obj_dirts)
instance_create(x,y + 12,obj_dirts)
instance_create(x,y + 18,obj_dirts)
instance_create(x,y + 24,obj_dirts)
instance_create(x,y + 30,obj_stones)
for (i=0;i<5;i++){
    instance_create(x,y + 30+6*i,obj_stones)
}*/
if frac(global.ascend/2)=0 {
    y += choose(-ascend,-ascend/2,0,0,ascend,ascend/2)
    }else {
    y += choose(-ascend,0,0,ascend)
}
x -= 32

/* */
/*  */
