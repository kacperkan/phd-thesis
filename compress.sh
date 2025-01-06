#!/bin/bash


formats=("screen" "ebook" "printer" "prepress")

for format in ${formats[@]}
do 
    echo "Formatting with ${format} ..."
    gs \
        -sDEVICE=pdfwrite \
        -dCompatibilityLevel=1.4 \
        -dPDFSETTINGS=/${format} \
        -dNOPAUSE \
        -dQUIET \
        -dBATCH \
        -dDownsampleColorImages=true \
        -dCompressFonts=true \
        -sOutputFile=thesis-${format}.pdf \
        aux/main.pdf 
done

echo "Finished!"