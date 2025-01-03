$execute as @e[type=#clock:player,tag=clock.$(player)] run function clock:update-vote-player with storage clock:positions vote-lights.$(player)
$execute unless entity @e[type=#clock:player,tag=clock.$(player)] run function clock:update-vote-disabled with storage clock:positions vote-lights.$(player)
