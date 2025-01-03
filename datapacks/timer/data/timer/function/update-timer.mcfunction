scoreboard players operation #timer:timer-minutes timer.num = #timer:timer timer.num
scoreboard players operation #timer:timer-seconds timer.num = #timer:timer timer.num
scoreboard players operation #timer:timer-minutes timer.num /= #timer:sixty timer.num
scoreboard players operation #timer:timer-seconds timer.num %= #timer:sixty timer.num
scoreboard players operation #timer:timer-tenseconds timer.num = #timer:timer-seconds timer.num
scoreboard players operation #timer:timer-tenseconds timer.num /= #timer:ten timer.num
scoreboard players operation #timer:timer-seconds timer.num %= #timer:ten timer.num
bossbar set timer:timer name [{"score":{"name":"#timer:timer-minutes","objective":"timer.num"}},":",{"score":{"name":"#timer:timer-tenseconds","objective":"timer.num"}},{"score":{"name":"#timer:timer-seconds","objective":"timer.num"}}]
execute store result bossbar timer:timer value run scoreboard players get #timer:timer timer.num
