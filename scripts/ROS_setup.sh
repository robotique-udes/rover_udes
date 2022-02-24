echo Ubuntu install of ROS Noetic : http://wiki.ros.org/noetic/Installation/Ubuntu

echo Setup your sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

echo Set up your keys
sudo apt install curl -y
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

echo Installation
sudo apt update -y
sudo apt install ros-noetic-desktop-full -y

echo Environment setup
grep "source /opt/ros/noetic/setup.bash" ~/.bashrc
if [$? -eq "1"]
then
	echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
	source ~/.bashrc
fi
	
echo Create catkin_ws
cd ~
mkdir -p catkin_ws/src
	
echo Dependencies for building packages
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential -y

sudo rosdep init
rosdep update

echo Install git repos
sudo apt install git-all -y

echo Adding a new SSH key to your GitHub account :
echo Please follow the steps below.

echo Generating SSH key
ssh-keygen -t ed25519
cat cat .ssh/id_ed25519.pub 
echo Please copy SSH key above

echo In your Github account, select profile/Settings/SSH and GPG keys.
echo Click on New SSH key.
echo Add a descriptive label such as the name of your PC.
echo Add the key generated above.
echo Click Add SHH key
echo Press key 

cd ~/catkin_ws/src
git clone git@github.com:robotique-udes/rover_control.git
git clone git@github.com:robotique-udes/zeus_rover.git
git clone git@github.com:robotique-udes/rover_udes.git
git clone git@github.com:robotique-udes/rover_base.git
git clone git@github.com:robotique-udes/rover_drivers.git

echo Finalising ROS setup with git repository
rosdep install --all -y
cd ..
catkin_make

echo Automatic setup of ROS complete, 1 manual step left
echo Last step : Ask for help to update /etc/hosts














