echo Ubuntu install of ROS Noetic : http://wiki.ros.org/noetic/Installation/Ubuntu

echo Setup your sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

echo Set up your keys
sudo apt install curl xclip -y
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
cd
mkdir -p catkin_ws/src
cd catkin_ws
catkin_make

grep "source ~/catkin_ws/devel/setup.bash" ~/.bashrc
if [$? -eq "1"]
then
	echo "source ~/catkin_ws/devel/setup.bash"  >> ~/.bashrc
	source ~/.bashrc
fi
	
echo Dependencies for building packages
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential -y

echo Install git repos
sudo apt install git-all -y
echo

echo Adding a new SSH key to your GitHub account :
echo Please follow the steps below.

echo Enter your git email
read email
git config --global user.email email

echo
echo Enter your git username
read name
git config --global user.name name


echo
echo Generating SSH key  ############## Gérer si déjà clé
ssh-keygen -t ed25519
cat ~/.ssh/id_ed25519.pub | xclip -selection c
echo Please copy SSH key above
echo Press key and enter to continue 
read

echo In your Github account, select profile/Settings/SSH and GPG keys.
echo Click on New SSH key.
echo Add a descriptive label such as the name of your PC.
echo Add the key generated above.
echo Click Add SHH key
echo Press key 
read

cd ~/catkin_ws/src
############################### Gérer si déjà git clone
git clone git@github.com:robotique-udes/rover_control.git 2> /dev/null 
git clone git@github.com:robotique-udes/zeus_rover.git 2> /dev/null
git clone git@github.com:robotique-udes/rover_udes.git 2> /dev/null
git clone git@github.com:robotique-udes/rover_base.git 2> /dev/null
git clone git@github.com:robotique-udes/rover_drivers.git 2> /dev/null

echo Finalising ROS setup with git repository
sudo rosdep init
rosdep update
rosdep install --all -y

cd ~/catkin_ws
catkin_make

echo Automatic setup of ROS complete, 1 manual step left
echo Last step : Ask for help to update /etc/hosts














