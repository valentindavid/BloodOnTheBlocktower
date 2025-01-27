# Building

## Dependencies

* Git
* GNU make and a Bourne shell, like Bash
* Python 3 (tested with 3.12)
* Jinja (tested with 3.1.5)

## Missing assets

Three files need to be put in place before it is possible to build the
resource pack.

 * resourcepacks/clock/assets/clock/sounds/ambient/vine-boom.ogg
 * resourcepacks/clock/assets/clock/sounds/ambient/womp-womp.ogg
 * resourcepacks/clock/assets/clock/sounds/ambient/ding.ogg

`vine-boom.ogg` and `womp-womp.ogg` are self descriptive. `ding.ogg`
should be a scary piano or violin chord.

## Build

For 8 players run:

```
make PLAYERS=8
```

This will give you two files `clock-datapack-*.zip` and
`clock-resourcepack-*.zip`.

If you want to regenerate for another number of player, you need first
to clean, for example:

```
make clean all PLAYERS=12
```
