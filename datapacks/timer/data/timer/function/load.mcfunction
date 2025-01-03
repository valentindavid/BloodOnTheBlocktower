scoreboard objectives add timer.num dummy

scoreboard players set #timer:ten timer.num 10
scoreboard players set #timer:sixty timer.num 60

bossbar add timer:timer [""]
bossbar set timer:timer visible false
bossbar set timer:timer players
