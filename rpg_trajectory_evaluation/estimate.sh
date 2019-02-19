#! /bin/bash
set -e
DIR_NAME=`pwd`/../estimate

if [ ! -d ${DIR_NAME} ]; then
    mkdir -p $DIR_NAME
fi

cd "scripts/"
python analyze_trajectory_single.py ../../try/

echo "Done."