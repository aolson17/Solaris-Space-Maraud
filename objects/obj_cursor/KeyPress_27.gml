var __b__;
__b__ = action_if_variable(room, ShipBuilder, 0);
if __b__
{
{
__b__ = action_if_variable(obj_save_mult.active, false, 0);
if __b__
{
action_end_game();
}
}
}
else
{
__b__ = action_if_variable(room, ShipBuilder, 0);
if !__b__
{
action_end_game();
}
}
