CC = gcc
CFLAGS = -Wall -Werror -Iinclude
SRCDIR = src
OBJDIR = build
TARGET = $(OBJDIR)/json_parser

#SOURCES = $(SRCDIR)/json.c $(SRCDIR)/tokenizer.c $(SRCDIR)/parser.c $(SRCDIR)/main.c
SOURCES = $(SRCDIR)/main.c
OBJECTS = $(SOURCES:$(SRCDIR)/%.c=$(OBJDIR)/%.o)

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJDIR) $(TARGET)

.PHONY: clean
