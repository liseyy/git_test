CFLAGS += -O2
#LDFLAGS += -ldl
#CC = mips-openwrt-linux-gcc #put your compiler path here
CC=gcc

bin := git_tst
dir = /usr/local/bin
sources := $(wildcard *.c)
objects := $(subst .c,.o,$(sources))

$(bin) : $(objects)
	@#cc -o $(bin) $^ $(LDFLAGS) 
	$(CC) -o $(bin) $^ 

install: $(bin)
	@echo install to directory: $(dir)
	@install -s -m 755 -g root -o root $(bin) $(dir) 
	@rm -f $(bin)

clean:
	@rm -f $(objects) *~ $(bin) 

