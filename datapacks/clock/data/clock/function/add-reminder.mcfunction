$tellraw @s ["Add reminder for ",{"selector":"@e[type=#clock:player,tag=clock.$(player)]"}," from..."]
$data modify storage clock:role-list add-reminder-current.player set value $(player)
data modify storage clock:role-list add-reminder-current.current_role set value 0
function clock:add-reminder-iterate-roles with storage clock:role-list add-reminder-current
