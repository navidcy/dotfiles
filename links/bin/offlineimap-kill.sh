#!/bin/sh
pid=$(ps aux|grep offlineimap|grep python|awk ' {print $2}')
kill -9 $pid
