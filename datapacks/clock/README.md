# Blood on the Clocktower

## Dependencies

* Requires "scheduler" data pack (from the same repository).

* Requires "timer" data pack (from the same repository).

* Requires "mapper" data pack (from the same repository).

* Requires "clock" resource pack provided from the server (from the
  same repository).

## Map preparation

### Recommended `server.properties`

```
difficulty=peaceful
gamemode=adventure
```

### Number of players

The script is set for 8 players by default. You will need to place the markers for all 8 players. But you do not need
to have that many players, it is just the maximum.

If you wish to have a different number of maximum players, you can
regenerate the datapack from the root of the git repository with something like:
```
make PLAYERS=10 clean all
```

### Getting the markers

Run:

```
/function clock:give-building-blocks
```

This will give you vote light markers, lever markers and sign markers
for every player. You need to place them all.

It will also give you a guillotine marker. Place it at the bottom of
where you want the anvil to fall on a slab (that will destroy
automatically the anvil). Make sure there is no ceiling vertically.

And finally it will give you a bell marker, which is where all the
sound effects will come from.

### Debugging the setup ###

You can debug with armor stands or villagers. Just set them as player
with the command book.

## Prepare the game

### Get the story teller command book

```
/function clock:get-command-book
```

Mark yourself as story tell on page "Set players". The story teller
should remain an operator.

### Tag your players

With the book on page "Set players", go close to each player and mark
them one by one.

### Prepare the script

In the "Setup roles" book, for each role, there is a check mark on the
left that says whether the role is in the script distributed to players. If
you click on them, you will enable/disable that role.

Then every player will receive a book called "Script" that will
contain the possible roles for the game.

### Distribute the roles

In the "Setup roles" book, click on the roles you want to add to the
bag (the name, not the check mark).

Once you are set. Distribute randomly the roles using "Distribute role
tokens" on the "Roles" page of your command book.

You should then receive grimoire.

## Grimoire

In the grimoire, you can modify the role of each player. Click on the
"pencil" icon and then follow the console.

You can toggle the team: good or evil. By clicking on the toggle icon.

You can add reminders by clicking on the "[ add reminder ]" button,
then follow the console.

You can remove reminders by clicking the X in front of it.

## Running the game

You can set the time with page "Time".

 * Morning is to tell the players to exit their private room and
   gather to the town square. They will discover who was killed. You
   should wait for the players to gather, then set the time to noon.

 * Noon is the time the players can decide to split and have private
   discussions.

 * When it is time to nominate and vote, set the time to the evening
   to call the players back to the town square.

 * After votes and eventual execution, set the time to night, and your
   players should return to their private rooms.

### Nomination and votes

First, nominate the person to vote for on page "Nominate".

Start the vote with "Start vote" on page "Votes".

### Killing

Page "Kills" offers the commands to kill players.

It is fun to execute people with the guillotine. And the game will
automatically set players as dead.

However, for other kind of death, it is better to silently kill with
the individual kill commands.

### Teleport

You can use page 5 to teleport to players.

Alternatively, you can use spectator mode and use the quickbar.
