#!/bin/bash
set -e

# Download the Devin Desktop .deb from the upstream repository
wget -q -P /deb-pkgs "https://windsurf-stable.codeiumdata.com/linux-x64-deb/stable/355c3c9ee32dad08f605d5ee8f9a7e6786316d4c/Devin-linux-x64-3.7.16.deb"

for file in /deb-pkgs/*; do
    if [ ! -f "$file" ]; then
        continue
    fi

    extension=${file##*.}
    if [ $extension != "deb" ]; then
        continue
    fi

    echo "installing $file"

    apt-get install -y $file
done
