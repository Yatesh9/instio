#!../../bin/linux-arm/fpgaIOC

## You may have to change fpgaIOC to something else
## everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/fpgaIOC.dbd"
fpgaIOC_registerRecordDeviceDriver pdbbase

## Load record instances
##dbLoadTemplate "db/user.substitutions"
##dbLoadRecords "db/dbSubExample.db", "user=root"
dbLoadRecords("db/vme_AI.db")
dbLoadRecords("db/vme_AO.db")
dbLoadRecords("db/vme_BI.db")
## Set this to see messages from mySub
#var mySubDebug 1

## Run this to trace the stages of iocInit
#traceIocInit

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncExample, "user=root"
