local_dir := engine/core
local_lib := $(local_dir)/libengine.a
local_src := $(addprefix $(local_dir)/,core.c)
local_objs := $(subst .c,.o,$(local_src))

libraries += $(local_lib)
sources += $(local_src)

$(local_lib): $(local_objs)
	$(AR) $(ARFLAGS) $@ $^
