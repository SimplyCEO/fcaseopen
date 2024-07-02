# Define colours
ESCAPE        := \033
RED           := $(ESCAPE)[31m
BOLD_RED      := $(ESCAPE)[1;31m
GREEN         := $(ESCAPE)[32m
BOLD_GREEN    := $(ESCAPE)[1;32m
YELLOW        := $(ESCAPE)[33m
BOLD_YELLOW   := $(ESCAPE)[1;33m
BLUE          := $(ESCAPE)[34m
BOLD_BLUE     := $(ESCAPE)[1;34m
PURPLE        := $(ESCAPE)[35m
BOLD_PURPLE   := $(ESCAPE)[1;35m
CYAN          := $(ESCAPE)[36m
BOLD_CYAN     := $(ESCAPE)[1;36m
RESET_COLOUR  := $(ESCAPE)[0m

ifndef CC
$(warning C compiler not detected. Setting default compiler to GCC...)
	CC :=	gcc
endif

ifndef BUILD_TYPE
	BUILD_TYPE = Release
endif

# TinyCC have different flag calls compared to other compilers
ifeq ($(CC), tcc)
	CFLAGS +=
else
	CFLAGS +=
endif

ifeq ($(BUILD_TYPE), Release)
	CFLAGS += -O3
else
	CFLAGS += -O0 -g3 -ggdb -Wall -Wextra -Werror
endif

OS := $(shell uname)
ifeq ($(OS), Darwin)
	CFLAGS += -Wnewline-eof
endif

PWD           := $(shell pwd)
OBJ_DIR       := $(PWD)/.obj
SRC_DIR       := $(PWD)
BIN_DIR       := $(PWD)/bin
DIRS          := .obj/ bin/
HEADERS       :=
LIBRARIES     :=

# Detect MinGW differences
ifndef MINGW_CHOST
	LIBRARIES   +=
else
	LIBRARIES   +=
endif

_TARGETS      := fcaseopen.run
_SOURCES      := fcaseopen.c test.c
_OBJECTS      := fcaseopen.o test.o

TARGETS       := $(addprefix $(BIN_DIR)/, $(_TARGETS))
SOURCES       := $(addprefix $(SRC_DIR)/, $(_SOURCES))
OBJECTS       := $(addprefix $(OBJ_DIR)/, $(_OBJECTS))

.PHONY: all

all: directories $(TARGETS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@printf "[CC] ""$(GREEN)""Building object '$<'""$(RESET_COLOUR)""\n"
	@$(CC) $(CFLAGS) $(HEADERS) -c $< -o $@

$(TARGETS): $(OBJECTS)
	@printf "[BIN] ""$(BOLD_GREEN)""Linking binary '$@'""$(RESET_COLOUR)""\n"
	@$(CC) $^ $(LIBRARIES) $(HEADERS) -o $@

directories: $(DIRS)

$(DIRS):
	@printf "[DIR] ""$(BLUE)""Directory ""$(BOLD_BLUE)""'$@'""$(RESET_COLOUR)$(BLUE)"" created""$(RESET_COLOUR).""\n"
	@mkdir -p $(PWD)/$@

clean:
	@rm -rv $(BIN_DIR) 2>/dev/null || true
	@rm -rv $(OBJ_DIR) 2>/dev/null || true
