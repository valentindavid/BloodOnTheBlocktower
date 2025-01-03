$tellraw @s ["Add reminder for ",{"selector":"@e[type=#clock:player,tag=clock.$(player)]"}," from ",{"storage":"clock:roles","nbt":"$(role).name","interpret": True},"..."]
$data modify storage clock:role-list add-reminder-current.player set value $(player)
$data modify storage clock:role-list add-reminder-current.role set value $(role)
data modify storage clock:role-list add-reminder-current.current_reminder set value 0
function clock:add-reminder-iterate-reminder with storage clock:role-list add-reminder-current
