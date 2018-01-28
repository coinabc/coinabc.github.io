#!/usr/bin/env bash
echo 'start'

git pull
pwd
cd /root/guowei/coinabc.github.io
wget https://calendar.google.com/calendar/ical/7je3t02hd7r2oei4c0osmgs8fo%40group.calendar.google.com/private-ee632e40105552ff877304e2af938a72/basic.ics

DIFF="$(diff basic.ics basic.ics.1 |grep 'END')"
if [ "$DIFF" != "" ]; then
    echo "DIFFERENT"
    echo "$DIFF"
    rm -rf basic.ics
    mv basic.ics.1 basic.ics

    git add -A
    git commit -m 'sync calendar '
    git push origin master

fi
rm -rf basic.ics.1
echo "end"
