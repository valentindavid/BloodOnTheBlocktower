$execute as @a[x=$(x),y=$(y),z=$(z),dx=$(dx),dy=$(dy),dz=$(dz)] unless entity @s[tag=autoroom.in-room-$(name)] run function autoroom:room-join {name: $(name)}
$execute as @a[tag=autoroom.in-room-$(name)] unless entity @s[x=$(x),y=$(y),z=$(z),dx=$(dx),dy=$(dy),dz=$(dz)] run function autoroom:room-leave {name: $(name)}
