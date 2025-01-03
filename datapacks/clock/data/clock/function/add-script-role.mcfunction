$execute if data storage clock:roles $(role).enabled run return 1
$data modify storage clock:roles $(role).enabled-text set value '{"text":"☑","color":"green"}'
$data modify storage clock:roles $(role).enabled set value true
function clock:re-add-roles-to-script
$tellraw @s ["Added role to script ", {"storage": "clock:roles", "nbt": "$(role).name", "interpret": true}]
function clock:give-rulebook-interactive
