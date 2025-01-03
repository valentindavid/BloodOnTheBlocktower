$data remove storage clock:grimoire players.$(player)
$execute if entity @e[type=#clock:player,tag=clock.$(player)] as @e[tag=clock.role_token,tag=!clock.role-picked,sort=random,limit=1] run function clock:give-role-to-player {player: $(player)}
