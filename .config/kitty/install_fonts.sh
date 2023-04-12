#!/bin/bash
FONT_NAME="SourceCodePro"
URL="https://github.com/adobe-fonts/source-code-pro/archive/1.017R.zip"

mkdir /tmp/adodefont
cd /tmp/adodefont
wget ${URL} -O ${FONT_NAME}.zip
unzip -o -j ${FONT_NAME}.zip
mkdir -p ~/.fonts
cp *.otf ~/.fonts
fc-cache -f -v

# if you have this errors :

# xset:  bad font path element (#0), possible causes are:
#     Directory does not exist or has wrong permissions
#     Directory missing fonts.dir
#     Incorrect font server address or syntax

# Run this :
# cd ~/.fonts
# sudo mkfontscale
# sudo mkfontdir