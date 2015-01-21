#!/bin/bash

if [ "$1" == "pdf" ]; then
    REPO_PATH="/home/ferron/personal_git/elasticsearch-definitive-guide/images"

    # generate docbook.xml file
    a2x --icons -f docbook -r "$REPO_PATH" -d book book.asciidoc -v

    # apply template to book.xml
    xsltproc /usr/share/xml/docbook/stylesheet/docbook-xsl/fo/docbook.xsl book.xml > book.fo

    # generate pdf
    fop -fo book.fo book.pdf
elif [ "$1" == "epub" ]; then
    a2x -fepub -dbook book.asciidoc -v
else
    echo "format not supported, choose pdf or epub"
fi
