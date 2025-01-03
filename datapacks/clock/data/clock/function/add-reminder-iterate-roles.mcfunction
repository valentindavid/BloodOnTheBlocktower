$scoreboard players set #clock:add-reminder-role-current clock.num $(current_role)

execute store result score #clock:add-reminder-role-len clock.num run data get storage clock:role-list roles
execute if score #clock:add-reminder-role-current clock.num = #clock:add-reminder-role-len clock.num run return 1

$data modify storage clock:role-list add-reminder-current.role set from storage clock:role-list roles[$(current_role)]

function clock:add-reminder-with-role with storage clock:role-list add-reminder-current

scoreboard players add #clock:add-reminder-role-current clock.num 1
execute store result storage clock:role-list add-reminder-current.current_role int 1.0 run scoreboard players get #clock:add-reminder-role-current clock.num

function clock:add-reminder-iterate-roles with storage clock:role-list add-reminder-current
