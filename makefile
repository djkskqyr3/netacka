
.PHONY = all clean run

BOTS = bot.o genialny_bot0.o
OBJECTS_CLIENT = netacka.o net.o $(BOTS)

CC = gcc
CFLAGS = -s -O2 -Wall
#CFLAGS = -g3

# change these for other systems
LIB = -lalleg -lm -lnet -lwsock32
CLIENT = netacka.exe

all: $(CLIENT) $(SERVER)

$(CLIENT): $(OBJECTS_CLIENT)
	$(CC) -s $(OBJECTS_CLIENT) -o $(CLIENT) $(LIB) -mwindows

clean:
	del *.o

# for SciTE; I set "make run" for the run command
run: $(CLIENT)
	$(CLIENT)
# change to ./$(EXE) if needed

netacka.o: net.h bots.inc 

net.o: net.h 

$(BOTS): net.h
