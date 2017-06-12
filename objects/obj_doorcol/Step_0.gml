if object_exists(obj_door) && distance_to_object(obj_door) = 0 {
x = link.x
y = link.y
} else {
    instance_destroy()
}

