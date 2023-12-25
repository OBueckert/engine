local_dir := engine/module
local_lib := $(local_dir)/libmodule.a
local_src := $(addprefix $(local_dir)/,module.c)
local_objs := $(subst .c,.o,$(local_src))

libraries += $(local_lib)
sources += $(local_src)

$(local_lib): $(local_objs)
	$(AR) $(ARFLAGS) $@ $^
