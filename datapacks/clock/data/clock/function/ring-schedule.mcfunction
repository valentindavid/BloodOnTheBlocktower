execute unless score #clock:bell clock.ring matches 1.. run return 1
scoreboard players remove #clock:bell clock.ring 1
function clock:bell-at with storage clock:positions bell
schedule function clock:ring-schedule 1s
