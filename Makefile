modules := engine/core engine/module engine/glfw app/game
programs :=
libraries :=
sources :=

CFLAGS += -g

objects = $(subst .c,.o,$(sources))
dependencies = $(subst .o,.d,$(objects))

include_dirs := engine include engine/glfw/src
CFLAGS += $(addprefix -I,$(include_dirs))
vpath %.h $(include_dirs)

all:

include $(addsuffix /module.mk,$(modules))

.PHONY: all
all: $(programs)

.PHONY: libraries
libraries: $(libraries)

.PHONY: clean
clean:
	rm $(objects) $(programs) $(libraries) $(dependencies) $(wayland_generated_code)

ifneq "$(MAKECMDGOALS)" "clean"

include $(dependencies)

endif

%.d: %.c
	$(CC) $(CFLAGS) -MM -MG -MT $(subst .c,.o,$<) $< > $@
