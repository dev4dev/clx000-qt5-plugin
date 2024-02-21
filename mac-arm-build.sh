#!/bin/bash

echo 'Start...'

# 0. homebrew qt
brew install qt@5

# switch to work dir
rm -rf ./qtserialbus

# 1. get code
git clone https://github.com/qt/qtserialbus qtserialbus
cd qtserialbus
git checkout v5.15.12-lts-lgpl

# 2. copy files into src/plugins/canbus at clx000can
CAN_DIR=src/plugins/canbus
DEST_DIR=${CAN_DIR}/clx000can
mkdir -p $DEST_DIR

cp -r ../*.cpp ${DEST_DIR}/
cp -r ../*.h ${DEST_DIR}/
cp -r ../plugin.json ${DEST_DIR}/
cp -r ../clx000can.pro ${DEST_DIR}/

# 3. append plugin to src/plugins/canbus/canbus.pro on line 13
#	SUBDIRS += passthrucan peakcan tinycan clx000can
sed -i '' -e  '13s/$/ clx000can/' ${CAN_DIR}/canbus.pro

# 4. qmake
qmake

# 5. make
make

open plugins/canbus
echo 'Done!'
