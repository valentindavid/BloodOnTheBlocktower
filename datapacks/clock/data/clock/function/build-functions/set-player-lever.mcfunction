$data modify storage clock:positions vote-lights.$(player).lever_x set from entity @s Pos[0]
$data modify storage clock:positions vote-lights.$(player).lever_y set from entity @s Pos[1]
$data modify storage clock:positions vote-lights.$(player).lever_z set from entity @s Pos[2]
$data modify storage clock:positions vote-lights.$(player).lever_facing set value $(facing)
$data modify storage clock:positions vote-lights.$(player).player set value $(player)
kill @s
