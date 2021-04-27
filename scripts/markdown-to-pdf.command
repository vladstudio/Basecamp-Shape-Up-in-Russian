#!/bin/bash

# -- install npm
# -- install latest mdpdf from https://github.com/BlueHatbRit/mdpdf :
# npm install mdpdf@2.1.1 -g

# edit /opt/homebrew/lib/node_modules/mdpdf/node_modules/puppeteer/lib/LifecycleWatcher.js
# replace 
# this._timeout = timeout;
# with
# this._timeout = 0;

folder=$(dirname "$0")
cd "${folder}"

for f in $(ls ../markdown/*.md); do
    cat "${f}" ../scripts/page-break.html >> "../temp/temp.md"
    # mv "${f/.md/.pdf}" ../temp/
done
mdpdf "../temp/temp.md" --format=A5 --no-emoji --style="../scripts/markdown-to-pdf.css"
mv "../temp/temp.pdf" "../pdf/Shape-Up-Russian.pdf"
rm ../temp/*

osascript -e 'display notification "PDF file has been created"'
