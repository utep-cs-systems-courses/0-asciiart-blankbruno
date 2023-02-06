# comments begin with #

# for convenience, define variable $(OBJS) to list of object files
OBJS= draw_shapes.o draw_chars.o 11x16font.o  uimain.o

# make has a "default rule" specifying how to build a an "object" file (.o) from a C source file (.c)
#            this rule includes $(CFLAGS) as one of cc's parameters 
CFLAGS=-g -O3 # -g for debug, -O3 for optimization

# first target is built by default.  Usually named "all"
#this depends on: that
all: asciidraw

# asciidraw (target) depends on all object files (prerequisites)
asciidraw: $(OBJS) 
	cc -o asciidraw $(CFLAGS) $(OBJS)

# all object files built from c files that include draw.h
$(OBJS): draw.h

# deletes files generated by compilation
clean:
	rm -f *.o asciidraw

run:asciidraw
	./asciidraw
