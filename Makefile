TEMPLATES =										\
	$(wildcard datapacks/clock/data/clock/function/*.mcfunction.jinja)		\
	$(wildcard datapacks/autoroom/data/autoroom/function/*.mcfunction.jinja)

TARGETS = $(patsubst %.mcfunction.jinja, %.mcfunction, $(TEMPLATES))

PLAYERS ?= 8

VERSION := $(shell git describe --always)

SOUNDS =								\
	resourcepacks/clock/assets/clock/sounds/ambient/vine-boom.ogg	\
	resourcepacks/clock/assets/clock/sounds/ambient/womp-womp.ogg	\
	resourcepacks/clock/assets/clock/sounds/ambient/ding.ogg

all: clock-datapack-$(VERSION).zip clock-resourcepack-$(VERSION).zip


clean:
	rm -f $(TARGETS)
	rm -f clock-datapack-$(VERSION).zip clock-resourcepack-$(VERSION).zip

%.mcfunction: %.mcfunction.jinja
	python3 ./tools/expand.py --players $(PLAYERS) --roles roles/ $@


DATAPACKS=					\
	datapacks/clock				\
	datapacks/autoroom			\
	datapacks/mapper			\
	datapacks/scheduler			\
	datapacks/timer

clock-datapack-$(VERSION).zip: $(TARGETS)
	python3 ./tools/merge-packs.py $@ $(DATAPACKS)

clock-resourcepack-$(VERSION).zip: $(TARGETS) $(SOUNDS)
	python3 ./tools/merge-packs.py $@ resourcepacks/clock

.PHONY: clean sounds
