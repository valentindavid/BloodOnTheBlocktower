$data modify storage clock:grimoire players.$(player).role_name set from storage clock:roles $(role).name
$data modify storage clock:grimoire players.$(player).team set from storage clock:roles $(role).default_team
$data modify storage clock:grimoire players.$(player).team_text set from storage clock:roles $(role).default_team_text

$execute as @a[tag=clock.storyteller] run tellraw @s ["",{"selector": "@e[type=#clock:player,tag=clock.$(player)]"}, " was given ", {"storage": "clock:roles", "nbt": "$(role).name", "interpret": true}]
