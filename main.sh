#! /bin/bash

cd ./ubuntu-nvidia-drivers-mirror

chmod +x ./makedriver.sh && ./makedriver.sh "$1"

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
sudo apt install -y tree
tree
