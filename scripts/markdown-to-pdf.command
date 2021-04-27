#!/bin/bash

# -- install npm
# -- install latest mdpdf from https://github.com/BlueHatbRit/mdpdf :
# npm install mdpdf@2.1.1 -g

# -- install cpdf (to merge pdf files)
# brew tap oncletom/cpdf
# brew install cpdf

folder=$(dirname "$0")
cd "${folder}"

for f in $(ls ../markdown/*.md); do
    mdpdf "${f}" --format=A5 --no-emoji --style="../scripts/markdown-to-pdf.css"
    mv "${f/.md/.pdf}" ../temp/
done
cpdf ../temp/*.pdf -o ../pdf/Shape-Up-Russian.pdf
rm ../temp/*

osascript -e 'display notification "PDF file has been created"'
