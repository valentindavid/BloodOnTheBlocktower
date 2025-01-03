$execute positioned $(x) $(y) $(z) as @e[type=#clock:player,tag=clock.$(player)] run data modify block ~ ~ ~ front_text.messages[1] set value '{"selector":"@e[type=#clock:player,tag=clock.$(player)]"}'
$execute positioned $(x) $(y) $(z) unless entity @e[type=#clock:player,tag=clock.$(player)] run data modify block ~ ~ ~ front_text.messages[1] set value '""'
