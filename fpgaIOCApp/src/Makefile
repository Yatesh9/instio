TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

# xxxRecord.h will be created from xxxRecord.dbd
DBDINC += xxxRecord

# Install xxxSupport.dbd into <top>/dbd
DBD += xxxSupport.dbd

# Build an IOC support library
LIBRARY_IOC += fpgaIOCSupport

# Compile and add the code to the support library
fpgaIOCSupport_SRCS += xxxRecord.c
fpgaIOCSupport_SRCS += devXxxSoft.c

# Link locally-provided code into the support library,
# rather than directly into the IOC application.
# This is required for Windows DLL builds.
fpgaIOCSupport_SRCS += dbSubExample.c
fpgaIOCSupport_SRCS += fpgaIOCHello.c
fpgaIOCSupport_SRCS += initTrace.c

fpgaIOCSupport_LIBS += $(EPICS_BASE_IOC_LIBS)
fpgaIOC_LIBS += asyn

# Build the IOC application
PROD_IOC = fpgaIOC

# fpgaIOC.dbd will be created and installed
DBD += fpgaIOC.dbd
# fpgaIOC.dbd will include these files:
fpgaIOC_DBD += base.dbd
fpgaIOC_DBD += xxxSupport.dbd
fpgaIOC_DBD += dbSubExample.dbd
fpgaIOC_DBD += fpgaIOCHello.dbd
fpgaIOC_DBD += initTrace.dbd
fpgaIOC_DBD += inst.dbd
fpgaIOC_SRCS += instio.c
# fpgaIOC_registerRecordDeviceDriver.cpp derives from fpgaIOC.dbd
fpgaIOC_SRCS += fpgaIOC_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
fpgaIOC_SRCS_DEFAULT += fpgaIOCMain.cpp
fpgaIOC_SRCS_vxWorks += -nil-

# Link in the code from our support library
fpgaIOC_LIBS += fpgaIOCSupport

# To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file
ifneq ($(SNCSEQ),)
    # Build sncExample into fpgaIOCSupport
    sncExample_SNCFLAGS += +r
    fpgaIOC_DBD += sncExample.dbd
    # A .stt sequence program is *not* pre-processed:
    fpgaIOCSupport_SRCS += sncExample.stt
    fpgaIOCSupport_LIBS += seq pv
    fpgaIOC_LIBS += seq pv

    # Build sncProgram as a standalone program
    PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    # A .st sequence program *is* pre-processed:
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

# Finally link IOC to the EPICS Base libraries
fpgaIOC_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE

