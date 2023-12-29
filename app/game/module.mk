local_dir := app/game
ifeq ($(OS),Windows_NT)
local_prog := $(local_dir)/game.exe
else
local_prog := $(local_dir)/game
endif
local_src := $(addprefix $(local_dir)/,game.c)
local_objs := $(subst .c,.o,$(local_src))

sources += $(local_src)
programs += $(local_prog)

$(local_prog): $(local_objs) $(libraries)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)
