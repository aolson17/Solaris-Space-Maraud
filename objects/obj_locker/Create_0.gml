
if room = ShipBuilder && global.loading = 0{
holding = 1
} else {
holding = 0
}

if room != ShipBuilder{
    alarm[0] = 2
}

event_inherited()

