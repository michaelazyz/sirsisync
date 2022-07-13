#!/bin/bash
##Script to import new users from SIS database to SIRSI

rm -f /usr/local/scripts/sirsixfer.log
touch /usr/local/scripts/sirsixfer.log
echo "****    SYNC STAFF RECORD      ****" >> /usr/local/scripts/sirsixfer.log
scp -v SIS2SIRS@db-prd1-host.epsb.ca:/home/SIS2SIRS/downloads/staff_record_extract.txt /s/sirsi/Unicorn/Xfer/ >> /usr/local/scripts/sirsixfer.log 2>&1
echo "****    SYNC STUDENT RECORD    ****" >> /usr/local/scripts/sirsixfer.log
scp -v SIS2SIRS@db-prd1-host.epsb.ca:/home/SIS2SIRS/downloads/student_record_extract.txt /s/sirsi/Unicorn/Xfer/ >> /usr/local/scripts/sirsixfer.log 2>&1

cat /usr/local/scripts/sirsixfer.log | strings| mailx -s "Sirsi Sync Transfer Log" -r sirsi@radar.epsb.ca michael.c.zhang@epsb.ca jon.berg@epsb.ca patrick.miller@epsb.ca