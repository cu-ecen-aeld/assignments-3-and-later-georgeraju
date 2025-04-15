#CROSS_COMPILE = Native

ifeq ($(CROSS_COMPILE),aarch64-none-linux-gnu-)
		compiler=aarch64-none-linux-gnu-gcc
	else
		compiler=cc
	endif

writer: writer.o
	$(compiler) writer.o  -o writer

writer.o: writer.c
	$(compiler) -c writer.c  -o writer.o


clean:
	rm -f writer
	rm -f *.o
