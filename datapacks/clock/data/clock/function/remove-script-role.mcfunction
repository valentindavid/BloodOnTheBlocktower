$execute unless data storage clock:roles $(role).enabled run return 1
$data modify storage clock:roles $(role).enabled-text set value '{"text":"☐","color":"red"}'
$data remove storage clock:roles $(role).enabled
function clock:re-add-roles-to-script
$tellraw @s ["Removed role from script ", {"storage": "clock:roles", "nbt": "$(role).name", "interpret": true}]
function clock:give-rulebook-interactive
