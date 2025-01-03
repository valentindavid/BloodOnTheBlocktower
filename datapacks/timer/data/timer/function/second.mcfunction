execute if score #timer:timer timer.num matches 1.. run scoreboard players remove #timer:timer timer.num 1
execute if score #timer:timer timer.num matches 1.. run function timer:update-timer
execute if score #timer:timer timer.num matches 0 run function #timer:timeout
