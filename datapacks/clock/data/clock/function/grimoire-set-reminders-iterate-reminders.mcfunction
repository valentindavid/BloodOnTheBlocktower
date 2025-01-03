$execute unless data storage clock:roles $(role).enabled run return 1

$scoreboard players set #clock:reminder-current clock.num $(current_reminder)

$execute store result score #clock:reminder-len clock.num run data get storage clock:role-list reminders.$(role)
execute if score #clock:reminder-current clock.num = #clock:reminder-len clock.num run return 1

$data modify storage clock:role-list reminder-current.reminder set from storage clock:role-list reminders.$(role)[$(current_reminder)]

function clock:grimoire-set-reminders-set-reminder with storage clock:role-list reminder-current

scoreboard players add #clock:reminder-current clock.num 1
execute store result storage clock:role-list reminder-current.current_reminder int 1.0 run scoreboard players get #clock:reminder-current clock.num

function clock:grimoire-set-reminders-iterate-reminders with storage clock:role-list reminder-current
