# Sign of Human Activity（SHA）

Sign of Human Activity is proposed to estimate the possibility to find human in the environment based on the RGB image and depth information. It detects 9 personal belongings and categorizes them into 3 different classes that have corresponding impacts to find human.


## Dependencies

anaconda env with python3.6 if using python2
```
pip install opencv-python
pip3 install cython
pip3 install git+https://github.com/waleedka/coco.git#subdirectory=PythonAPI
```
set own envrionment
`conda create --name myenv python=3.6 numpy scipy pyparsing pyyaml pytorch torchvision`

in the conda env
```
pip install pyyaml cython opencv-python pillow pycocotools matplotlib rospkg empy
pip install torch==1.7.1+cu101 torchvision==0.8.2+cu101 torchaudio==0.7.2 -f https://download.pytorch.org/whl/torch_stable.html
sudo apt-get install python-catkin-tools python3-dev python3-catkin-pkg-modules python3-numpy python3-yaml ros-melodic-cv-bridge
conda install boost
```
realsense ros install

`sudo apt-get install ros-$ROS_DISTRO-realsense2-camera`

## Installation

### ROS Melodic
catkin_make the project using the python3.6 
`catkin_make -DPYTHON_EXECUTABLE=/home/YOUR DIR/anaconda3/envs/myenv/bin/python3.6 -DPYTHON_INCLUDE_DIR=/home/YOUR DIR/anaconda3/envs/myenv/include/python3.6m -DPYTHON_LIBRARY=/home/YOUR DIR/anaconda3/envs/myenv/lib/libpython3.6m.so  -DCMAKE_BUILD_TYPE=Debug`

If errors like ImportError: cannot import name 'CvBridge'
ImportError: dynamic module does not define module export function (PyInit_cv_bridge_boost) happen, please remove the build folder and devel folder in the main catkin workspace and rebuild the project in the anaconda environment.

### ROS Noetic
on jackal
`catkin_make  -DCMAKE_BUILD_TYPE=Debugconda`

on laptop
`catkin_make`



# Usage

## launch the realsense camera
`roslaunch realsense2_camera rs_camera.launch align_depth:=true`

## launch the yolact system
`rosrun yolact_ros yolact_ros _image_topic:="/camera/color/image_raw"`

## launch SHA evaluation
`rosrun sha sha`

# Important settings on Jackal
Jackal static IP on extremerobotics WIFI access: 172.19.4.52

If `ssh administrator@172.19.4.52` doesn't work
try `sudo ip li set mtu 1200 dev enp4s0(change)`

Jackal ROS master
`export ROS_MASTER_URI='http://cpr-j100-0669:11311'`


