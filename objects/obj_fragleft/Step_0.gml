ascend = global.ascend * 32
if __view_get( e__VW.XView, 0 ) -64 < x{
    instance_create(x,y,obj_topdirts)
    if frac(global.ascend/2)=0 {
    y += choose(-ascend,-ascend/2,0,0,ascend,ascend/2)
    }else {
    y += choose(-ascend,0,0,ascend)
    }
    
    x -= 32
}

