# Blood on the Clocktower in Minecraft

See the README for the different components.

* `resourcepacks/`: resource packs
  * [`clock/`](resourcepacks/clock/README.md) Resource pack needed on clients.

* `datapacks/`: data packs
  * [`scheduler/`](datapacks/scheduler/README.md) Utility to schedule every half and full second
  * [`timer/`](datapacks/timer/README.md) Utility to schedule every half and full second
  * [`autoroom/`](datapacks/autoroom/README.md) Automatic chat rooms
  * [`clock/`](datapacks/clock/README.md) The game logic

## Installation

### Data packs

Each data pack should be copied into `datapacks` directory of the
world directory of the server. They can also provided as zip files.

The world directory on a server is `world` by default, unless changed
in `level-name` entry in the `server.properties`.

### Resource packs

There is only one resource pack. It should be zipped and provided by
an HTTP(s) server. The URL for it should be added to `resource-pack`
entry of `server.properties`. Before being zipped, follow the
instructions in its [README.md](resourcepacks/clock/README.md).
