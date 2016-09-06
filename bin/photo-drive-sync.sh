#!/bin/bash

diskA=/Volumes/ANDERS
diskB=/Volumes/SUSAN
#diskC=/Volumes/misc

echo "Copying from local drive to first external drive ($diskA)"

# Lightroom
echo "Copying Lightroom files to first external drive ($diskA)"
rsync -rav --progress ~/Pictures/Lightroom $diskA/Anders\ flaptop/
rsync -rav --progress ~/iCloud/Lightroom-exports $diskA/Anders\ flaptop/

# Capture One
echo "Copying Capture One files to first external drive ($diskA)"
rsync -rav --progress ~/Pictures/Capture\ One\ Catalog.cocatalog $diskA/Anders\ flaptop/
rsync -rav --progress ~/Pictures/CaptureOne\ exports $diskA/Anders\ flaptop/

# Photos.app
echo "Copying Photos.app files to first external drive ($diskA)"
rsync -rav --progress ~/Pictures/Photos\ Library.photoslibrary $diskA/Anders\ flaptop/
rsync -rav --progress ~/Pictures/Photos\ exports $diskA/Anders\ flaptop/

if [ -d $diskB ]; then
    echo "Mirroring external drives ($diskA -> $diskB)"
    rsync -rav --delete --exclude="/.*" --progress $diskA/ $diskB
fi

read -p "Unmount external drive $diskA? [y/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    diskutil eject $diskA
fi

if [ -d $diskB ]; then
    read -p "Unmount external drive $diskB? [y/N] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        diskutil eject $diskB
    fi
fi

#if [ -d $diskC ]; then
#    read -p "Unmount external drive $diskC? [y/N] " -n 1 -r
#    echo
#    if [[ $REPLY =~ ^[Yy]$ ]]; then
#        diskutil eject $diskC
#    fi
#fi
