local_dir := app/game
local_prog := $(local_dir)/game
local_src := $(addprefix $(local_dir)/,game.c)
local_objs := $(subst .c,.o,$(local_src))

sources += $(local_src)
programs += $(local_prog)

$(local_prog): $(local_objs) $(libraries)
