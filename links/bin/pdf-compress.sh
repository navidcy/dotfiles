#!/bin/sh

if [[ $# -gt 0 ]]; then

    for f in "$@"; do
        echo "processing '$f'"
        /usr/local/bin/gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 \
            -dPDFSETTINGS=/default -dNOPAUSE -dQUIET -dBATCH \
            -dDetectDuplicateImages \
            -dCompressFonts=true -r150 \
            -sOutputFile="${f%.*}_compressed.pdf" "$f";
    done
else
    echo "Error: you must specify one or more input PDF files"
    exit 1 
fi
