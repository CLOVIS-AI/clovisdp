#!/bin/bash

SOURCE=.
DESTINATION=/run/user/1000/gvfs/ftp:host=62.210.233.75,user=168251_admin/world/datapacks/clovis
TEMP=/tmp/rsync

echo "Cleaning /tmp..."
rm -rf ${TEMP}
mkdir ${TEMP}

echo "Sending the file..."
rsync -adO --omit-dir-times --progress ${SOURCE} ${DESTINATION} \
    --exclude .idea \
    --exclude clovisdp.iml \
    --exclude publi.sh \
    --temp-dir=${TEMP}
