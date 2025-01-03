$data modify storage clock:positions sign.$(player).x set from entity @s Pos[0]
$data modify storage clock:positions sign.$(player).y set from entity @s Pos[1]
$data modify storage clock:positions sign.$(player).z set from entity @s Pos[2]
$execute at @s run setblock ~ ~ ~ oak_wall_sign[facing=$(backing)]
kill @s
