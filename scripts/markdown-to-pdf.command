#!/bin/bash

# This script generates a single PDF file from .md files in "markdown" folder.
# It requires mdpdf: https://github.com/BlueHatbRit/mdpdf
# npm install mdpdf@2.1.1 -g

# Out of the box, mdpdf fails with timeout. To fix this,
# edit /opt/homebrew/lib/node_modules/mdpdf/node_modules/puppeteer/lib/LifecycleWatcher.js
# and replace "this._timeout = timeout;" with "this._timeout = 0;"


# set working folder
folder=$(dirname "$0")
cd "${folder}"

# cleanup
mkdir -p ../temp
rm ../temp/*

# merge markdown files
for f in $(ls ../markdown/*.md); do
    cat "${f}" ../scripts/page-break.html >> ../temp/temp.md
done

# generate pdf from temp.md
mdpdf ../temp/temp.md --format=A5 --no-emoji --style="../scripts/markdown-to-pdf.css"
mv "../temp/temp.pdf" "../pdf/Shape-Up-Russian.pdf"
rm ../temp/*

# display notification
osascript -e 'display notification "PDF file has been created"'
