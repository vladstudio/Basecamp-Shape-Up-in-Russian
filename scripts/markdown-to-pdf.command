#!/bin/bash

## install mdpdf from https://github.com/BlueHatbRit/mdpdf
## npm install mdpdf@2.1.1 -g

mdpdf ../test/test.md --format=A5 --no-emoji --style="../scripts/markdown-to-pdf.css"
osascript -e 'display notification "PDF file has been created"'