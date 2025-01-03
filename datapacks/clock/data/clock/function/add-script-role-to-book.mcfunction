$execute unless data storage clock:roles $(role).enabled run return 1

$data modify storage clock:script pages[-1].roles append value '{"storage":"clock:roles","nbt":"$(role).name","interpret":true}'
execute store result score #clock:script-page-roles clock.num run data get storage clock:script last-page.roles
scoreboard players add #clock:script-page-roles clock.num 1
execute store result storage clock:script last-page.roles int 1.0 run scoreboard players get #clock:script-page-roles clock.num
execute if score #clock:script-page-roles clock.num matches 14.. run function clock:add-script-page
