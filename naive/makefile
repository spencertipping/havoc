CC      = /usr/bin/gcc
CC_OPTS = -g -Wall -O2 -mtune=native -Wno-char-subscripts

HEADERS = ast.h
OBJECTS = parser.o

naive: $(OBJECTS)
	$(LD) $(LD_OPTS) $(OBJECTS)

%.cc: %.cc.sdoc
	./sdoc $<

%.h: %.h.sdoc
	./sdoc $<

%.o: %.cc $(HEADERS)
	$(CC) $(CC_OPTS) $< -o $@
