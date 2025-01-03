$data modify storage clock:positions vote-lights.$(player).x set from entity @s Pos[0]
$data modify storage clock:positions vote-lights.$(player).y set from entity @s Pos[1]
$data modify storage clock:positions vote-lights.$(player).z set from entity @s Pos[2]
$data modify storage clock:positions vote-lights.$(player).next set value $(next)
kill @s
