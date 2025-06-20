# Project Name
TARGET = fxwiegand-reverb

# Sources
CPP_SOURCES = reverb.cpp

# Library Locations
LIBDAISY_DIR = ../../lib/libDaisy
DAISYSP_DIR = ../../lib/DaisySP

# Enable LGPL modules for ReverbSc
USE_DAISYSP_LGPL = 1

# Core location, and generic Makefile.
SYSTEM_FILES_DIR = $(LIBDAISY_DIR)/core
include $(SYSTEM_FILES_DIR)/Makefile

# Include terrarium.h
C_INCLUDES += -I../../lib/Terrarium
