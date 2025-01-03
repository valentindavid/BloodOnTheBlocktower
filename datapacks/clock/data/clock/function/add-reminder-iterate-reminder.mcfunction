$scoreboard players set #clock:add-reminder-current clock.num $(current_reminder)

$execute store result score #clock:add-reminder-len clock.num run data get storage clock:role-list reminders.$(role)
execute if score #clock:add-reminder-current clock.num = #clock:add-reminder-len clock.num run return 1

$data modify storage clock:role-list add-reminder-current.reminder set from storage clock:role-list reminders.$(role)[$(current_reminder)]

function clock:add-reminder-with-reminder with storage clock:role-list add-reminder-current

scoreboard players add #clock:add-reminder-current clock.num 1
execute store result storage clock:role-list add-reminder-current.current_reminder int 1.0 run scoreboard players get #clock:add-reminder-current clock.num

function clock:add-reminder-iterate-reminder with storage clock:role-list add-reminder-current
