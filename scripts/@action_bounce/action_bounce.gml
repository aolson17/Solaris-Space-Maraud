/// @description (Old DnD) - Allows bouncing of the calling instance
/// @param advanced Whether to enable advanced bouncing (true) or not (false)
/// @param solid true if solid
var __solid = argument1;
if (solid) {
	move_bounce_solid(argument0);
} else {
	move_bounce_all(argument0);
}
