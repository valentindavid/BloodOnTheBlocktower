$data modify storage clock:grimoire players.$(player).player set value $(player)
$data modify storage clock:grimoire players.$(player).role set value $(role)
$function clock:set-role-assignment with storage clock:grimoire players.$(player)
function clock:get-grimoire
