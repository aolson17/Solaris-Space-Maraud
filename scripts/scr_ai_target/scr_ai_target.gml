///(scr_ai_target("lateral" or "rotational")
type = argument0


if type = "lateral"{

	return abs(point_distance(x+curh*25,y+curv*25,obj_player.navLink.x+obj_player.navLink.curh*2,obj_player.navLink.y+obj_player.navLink.curv*2) - closeness)
	
}


