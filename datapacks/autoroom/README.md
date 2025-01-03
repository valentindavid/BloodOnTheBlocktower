# Autoroom data pack

## Dependencies

### Mods

- Simple Voice Chat
- Simple Voice Chat Enhanced Groups

### Data packs

- mapper (provided from the same repository)
- scheduler (provided from the same repository)

## Set up

### Creating of a room

Get the tools with

```
/function autoroom:create-room
```

Place "Start room X" as the first block of a rectangular cuboid
representing the room.

Then place "End room X" in the other extremity of the cuboid.

You can then place up to 4 "busy" signs.

### Edit an existing room

You can get the tools again for a specifc room

```
/function autoroom:create-room {room: 3}
```

### Removing a room

```
/function autoroom:remove-room {room: 3}
```
