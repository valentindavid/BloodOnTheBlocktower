$scoreboard players set #clock:role-list-current clock.num $(current)
execute store result score #clock:role-list-len clock.num run data get storage clock:role-list roles
execute if score #clock:role-list-current clock.num = #clock:role-list-len clock.num run return 1

$data modify storage clock:role-list current-name.role set from storage clock:role-list roles[$(current)]

function clock:add-script-role-to-book with storage clock:role-list current-name

scoreboard players add #clock:role-list-current clock.num 1
execute store result storage clock:role-list current.current int 1.0 run scoreboard players get #clock:role-list-current clock.num

function clock:re-add-roles-to-script-iterate with storage clock:role-list current
