scoreboard players add #scheduler:halfsecond scheduler.ticks 1
execute if score #scheduler:halfsecond scheduler.ticks matches 10.. run scoreboard players set #scheduler:halfsecond scheduler.ticks 0
execute if score #scheduler:halfsecond scheduler.ticks matches 0 run function #scheduler:halfsecond

scoreboard players add #scheduler:second scheduler.ticks 1
execute if score #scheduler:second scheduler.ticks matches 20.. run scoreboard players set #scheduler:second scheduler.ticks 0
execute if score #scheduler:second scheduler.ticks matches 0 run function #scheduler:second
