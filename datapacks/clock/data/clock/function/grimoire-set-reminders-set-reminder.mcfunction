data remove storage clock:role-list reminder-current.player
$data modify storage clock:role-list reminder-current.player set from storage clock:roles $(role).reminders.$(reminder).player
function clock:grimoire-set-reminders-for-player with storage clock:role-list reminder-current
