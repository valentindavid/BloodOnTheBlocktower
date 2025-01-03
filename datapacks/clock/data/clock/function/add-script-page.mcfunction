data modify storage clock:script pages append value {roles: []}
execute store result score #clock:script-pages clock.num run data get storage clock:script last-page.page
scoreboard players add #clock:script-pages clock.num 1
execute store result storage clock:script last-page.page int 1.0 run scoreboard players get #clock:script-pages clock.num
function clock:add-script-page-nr with storage clock:script last-page
data modify storage clock:script last-page.roles set value 0
