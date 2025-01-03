$execute as @e[type=#clock:player,tag=clock.$(player)] run tag @s remove $(player)
$execute as @e[type=#clock:player,tag=!clock.storyteller,sort=nearest,limit=1] run function clock:set-player-tag {player: $(player)}
execute as @a run function clock:give-players-book
execute as @a run function clock:give-script-book
function clock:update-signs
function clock:get-command-book
