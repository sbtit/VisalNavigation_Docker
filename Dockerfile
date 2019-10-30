FROM ros:kinetic-ros-core-xenial

WORKDIR /home

RUN apt-get update -y \
  && apt-get install -y \
    git \
    ntp \
    ros-kinetic-laser-proc \
    ros-kinetic-rgbd-launch \
    ros-kinetic-depthimage-to-laserscan \
    ros-kinetic-rosserial-python \
    ros-kinetic-rosserial-server \
    ros-kinetic-rosserial-client \
    ros-kinetic-rosserial-msgs \
    ros-kinetic-amcl \
    ros-kinetic-map-server \
    ros-kinetic-move-base \
    ros-kinetic-urdf \
    ros-kinetic-xacro \
    ros-kinetic-compressed-image-transport \
    ros-kinetic-rqt-image-view \
    ros-kinetic-rtabmap-ros \
    ros-kinetic-robot-localization \
    ros-kinetic-navigation \
    ros-kinetic-gazebo-ros-pkgs \
    ros-kinetic-gazebo-ros-control \
    ros-kinetic-rviz \
    ros-kinetic-robot-state-publisher \
    ros-kinetic-joint-state-publisher \
    ros-kinetic-rqt \
    ros-kinetic-rqt-common-plugins \
    ros-kinetic-stereo-image-proc \
    ros-kinetic-pointcloud-to-laserscan \
    ros-kinetic-dynamic-reconfigure \
    ros-kinetic-rqt-reconfigure \
    ros-kinetic-camera-calibration \
    ros-kinetic-image-view \
    ros-kinetic-uvc-camera \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/ \
  && mkdir -p catkin_ws/src \
  && cd catkin_ws/src \
  && git clone https://github.com/sbtit/gopigo3_navigation.git \
  && cd /home/catkin_ws \
  && cp -rf /home/catkin_ws/src/gopigo3_navigation/pointcloud_to_laserscan/ /home/catkin_ws/src/ \
  && bash -c "source /opt/ros/kinetic/setup.bash \
  && catkin_make"

COPY ./entry.sh /
COPY ./ntp.conf /etc/
COPY ./setting4.yaml /
COPY ./setting5.yaml /

RUN chmod +x /entry.sh

ENTRYPOINT ["/entry.sh"]
CMD ["bash"]

