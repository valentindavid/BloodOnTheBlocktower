$execute unless data storage clock:roles $(role).enabled run return run function clock:add-script-role {role: $(role)}
$execute if data storage clock:roles $(role).enabled run return run function clock:remove-script-role {role: $(role)}
