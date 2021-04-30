#!/bin/bash

# This script generates a single PDF file from .md files in "markdown" folder.
# It requires mdpdf: npm install mdpdf@2.1.1 -g

# Out of the box, mdpdf fails with timeout. To fix, edit
# /opt/homebrew/lib/node_modules/mdpdf/node_modules/puppeteer/lib/LifecycleWatcher.js
# and replace "this._timeout = timeout;" with "this._timeout = 0;"

# set working folder
folder=$(dirname "$0")
cd "${folder}"

# pre-cleanup
mkdir -p ../temp
rm ../temp/*

# merge markdown files
for f in $(ls ../markdown/*.md); do
    cat "${f}" ../scripts/pieces/page-break.html >> ../temp/temp.md
done

# generate pdf from temp.md
mdpdf ../temp/temp.md \
  --format=A5 --no-emoji \
# --header ../scripts/pieces/header.html \
# --footer ../scripts/pieces/footer.html \
  --style=../scripts/pieces/markdown-to-pdf.css

mv ../temp/temp.pdf ../pdf/Shape-Up-Russian.pdf

# post-cleanup
rm ../temp/*

# display notification
osascript -e 'display notification "PDF file has been created"'
