#! /bin/bash
set -e

if [ $# -lt 2 ]; then
    echo "Usage: estimate.sh [corrected_poses.txt] [poses_list.serial] "
    exit 1;
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${DIR}"

corrected_poses=$1
poses_list=$2

DIR_NAME=`pwd`/../trajectory_estimate

if [ ! -d ${DIR_NAME} ]; then
    mkdir -p $DIR_NAME
fi


python ioforrpg.py $corrected_poses "${DIR_NAME}/stamped_groundtruth.txt" 13
python ioforrpg.py $poses_list "${DIR_NAME}/stamped_traj_estimate.txt" 17
cp eval_cfg.yaml ${DIR_NAME}

cd "scripts/"
python analyze_trajectory_single.py ${DIR_NAME}

echo "Done."