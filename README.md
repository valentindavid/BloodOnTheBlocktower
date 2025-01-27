# Blood on the Clocktower in Minecraft

## Requirements

This is for Minecraft Java edition 1.21.4.

[Simple Voice Chat](https://modrepo.de/minecraft/voicechat/overview)
must be installed on the server and clients.

[Simple Voice Chat Enhanced Groups](https://modrepo.de/minecraft/voicechat/addons#simple-voice-chat-enhanced-groups)
must be installed on the server.

## Installation

You should get two files from either the
[release](https://github.com/valentindavid/BloodOnTheBlocktower/releases)
or from [building](BUILD.md): `clock-datapack-*.zip` and
`clock-resourcepack-*.zip`.

`clock-datapack-*.zip` has to be placed in the `datapacks` directory
in your world directory. Your world directory should have the same
name as `level-name` entry in `server.properties`. The default is
`world` from the root of the server.

The URL to the resource pack has to be placed in `server.properties`,
in entry `resource-pack`. Like such:

```
resource-pack=https\://github.com/valentindavid/BloodOnTheBlocktower/releases/download/X.Y/clock-resourcepack-X.Y.zip
```

Alternatively, you can host the file yourself.

If your server has already a resource pack, you will need to merge the
resource packs.

## Building

See [BUILD.md](BUILD.md).

## Setup

Follow the setup instructions for the sub data packs:
  * [`autoroom`](datapacks/autoroom/README.md)
  * [`clock`](datapacks/clock/README.md)

There is a video explanation of the setup available:
[Blood on the Clocktower in Minecraft: a data pack](https://www.youtube.com/watch?v=9Q6nJ_8ZaS8).

## Details

See the README for the different components.

* `resourcepacks/`: resource packs
  * [`clock/`](resourcepacks/clock/README.md) Resource pack needed on clients.

* `datapacks/`: data packs
  * [`scheduler/`](datapacks/scheduler/README.md) Utility to schedule every half and full second
  * [`timer/`](datapacks/timer/README.md) Utility to schedule every half and full second
  * [`autoroom/`](datapacks/autoroom/README.md) Automatic chat rooms
  * [`clock/`](datapacks/clock/README.md) The game logic
  * [`mapping/`](mapping/clock/README.md) Mapping utility
