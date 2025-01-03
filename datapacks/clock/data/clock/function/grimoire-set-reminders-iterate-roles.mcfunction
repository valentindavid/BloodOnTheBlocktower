$scoreboard players set #clock:reminder-role-current clock.num $(current_role)

execute store result score #clock:reminder-role-len clock.num run data get storage clock:role-list roles
execute if score #clock:reminder-role-current clock.num = #clock:reminder-role-len clock.num run return 1

$data modify storage clock:role-list reminder-current.role set from storage clock:role-list roles[$(current_role)]
data modify storage clock:role-list reminder-current.current_reminder set value 0

function clock:grimoire-set-reminders-iterate-reminders with storage clock:role-list reminder-current

scoreboard players add #clock:reminder-role-current clock.num 1
execute store result storage clock:role-list reminder-current.current_role int 1.0 run scoreboard players get #clock:reminder-role-current clock.num

function clock:grimoire-set-reminders-iterate-roles with storage clock:role-list reminder-current
