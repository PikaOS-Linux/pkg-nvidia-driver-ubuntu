#! /bin/bash

cd ./ubuntu-nvidia-drivers-mirror

chmod +x ./makedriver.sh && ./makedriver.sh "$1"

# Move the debs to output
sudo apt install -y tree
tree

mkdir -p ./output
mv ./*.deb ./output/
