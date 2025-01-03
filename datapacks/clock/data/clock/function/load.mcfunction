scoreboard objectives add clock.deaths deathCount
scoreboard objectives add clock.alive-voters dummy
scoreboard objectives add clock.needed-votes dummy
scoreboard objectives add clock.votes dummy
scoreboard objectives add clock.ring dummy
scoreboard objectives add clock.num dummy
scoreboard players set #clock:two clock.num 2
team add clock.main
team modify clock.main seeFriendlyInvisibles true
gamerule keepInventory true
gamerule sendCommandFeedback false
function clock:initialize-db

data modify storage clock:timepoints morning.time set value 500
data modify storage clock:timepoints morning.title set value "Good morning!"
data modify storage clock:timepoints morning.subtitle set value "Please proceed to the town square."
data modify storage clock:timepoints morning.timer set value 0
data modify storage clock:timepoints morning.next set value noon

data modify storage clock:timepoints noon.time set value 6000
data modify storage clock:timepoints noon.title set value "Discussion time!"
data modify storage clock:timepoints noon.subtitle set value "You have five minutes."
data modify storage clock:timepoints noon.timer set value 300
data modify storage clock:timepoints noon.next set value evening

data modify storage clock:timepoints evening.time set value 12000
data modify storage clock:timepoints evening.title set value "Voting time!"
data modify storage clock:timepoints evening.subtitle set value "Please return to the town square."
data modify storage clock:timepoints evening.timer set value 0
data modify storage clock:timepoints evening.next set value night

data modify storage clock:timepoints night.time set value 18000
data modify storage clock:timepoints night.title set value "Good night!"
data modify storage clock:timepoints night.subtitle set value "Please go to your home."
data modify storage clock:timepoints night.timer set value 0
data modify storage clock:timepoints night.next set value night
