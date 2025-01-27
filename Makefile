TEMPLATE_DIRS =						\
	datapacks/clock/data/clock/function		\
	datapacks/autoroom/data/autoroom/function

TEMPLATES = $(foreach dir,$(TEMPLATE_DIRS),$(wildcard $(dir)/*.jinja))

TARGETS = $(patsubst %.jinja, %, $(TEMPLATES))

DEPFILES = $(foreach target,$(TARGETS),$(dir $(target)).deps/$(notdir $(target)).dep)
DEPDIRS = $(foreach dir,$(TEMPLATE_DIRS),$(dir)/.deps)

PLAYERS ?= 8

VERSION := $(shell git describe --always)

SOUNDS =								\
	resourcepacks/clock/assets/clock/sounds/ambient/vine-boom.ogg	\
	resourcepacks/clock/assets/clock/sounds/ambient/womp-womp.ogg	\
	resourcepacks/clock/assets/clock/sounds/ambient/ding.ogg

all: clock-datapack-$(VERSION).zip clock-resourcepack-$(VERSION).zip
	@echo "======================================================================"
	@echo "Built files:"
	@echo " * Datapack:     clock-datapack-$(VERSION).zip"
	@echo " * Resourcepack: clock-resourcepack-$(VERSION).zip"
	@echo "======================================================================"

.stamps/players-$(PLAYERS):
	rm -f .stamps/players-*
	mkdir -p .stamps
	touch $@

clean:
	rm -f $(TARGETS)
	rm -rf $(DEPDIRS) .stamps
	rm -f clock-datapack-$(VERSION).zip clock-resourcepack-$(VERSION).zip

%.mcfunction: ./tools/expand.py .stamps/players-$(PLAYERS)
	python3 ./tools/expand.py --players $(PLAYERS) --write-deps $(dir $@).deps/$(notdir $@).dep --roles roles/ $@

DATAPACKS=					\
	datapacks/clock				\
	datapacks/autoroom			\
	datapacks/mapper			\
	datapacks/scheduler			\
	datapacks/timer

clock-datapack-$(VERSION).zip: ./tools/merge-packs.py $(TARGETS)
	python3 ./tools/merge-packs.py $@ $(DATAPACKS)

clock-resourcepack-$(VERSION).zip: ./tools/merge-packs.py $(TARGETS) $(SOUNDS)
	python3 ./tools/merge-packs.py $@ resourcepacks/clock

.PHONY: all clean sounds

-include $(DEPFILES)
