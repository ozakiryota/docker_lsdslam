# doker_lsdslam

A dockerfile for LSD-SLAM

## Recuirements
* Docker
* Nvidia driver
* Nvidia Docker

## Usage
### 0. Set up
You need to install "Recuirements" above.
### 1. Download these files
		$ mkdir -p ~/docker_ws/lsdslam
		$ cd ~/docker_ws/lsdslam
		$ git clone https://github.com/ozakiryota/docker_lsdslam
#### 1.5 Modify the Dockerfile depending on your want
The defalt work the Docker does first when it is run is live_slam with your own camera.  
You can change to using the test bagfile, your own bagfile... by modify Dockerfile  

@Dockerfile  
line 113~end delete or add "#" to each line
### 2. Docker build
		($ cd ~/docker_ws/lsdslam)
		$ docker build -t lsdslam:latest .	//you can change the image name
This would take long time to finish.  
You can make it shorter like below if you don't need the test bagfile,  

@Dockerfile  
69 # RUN wget http://vmcremers8.informatik.tu-muenchen.de/lsd/LSD_room.bag.zip  
70 # RUN apt-get update && apt-get install -y unzip  
71 # RUN unzip LSD_room.bag.zip  

You can also delete opencv part if you don't need.
#### 2.5 Modify the script file
You need to fix your webcam in the script file.  
+ Using your webcam  
Make sure line 15 "--device=/dev/video1:/dev/video0 \".
+ Using just bagfile, not your webcam  
Delete line 15.
### 3. Run
		($ cd ~/docker_ws/lsdslam)
		$ ./run_docker.sh lsdslam:latest	//use your image name insted of "lsdslam:latest"
### 4. Quit
Ctrl+c → Ctrl+d
## Other things
+ You should swap "camera.yaml" depending on your webcam.  
You can get it by camera_calibration from ROS.
+ Wide view cameras would be better.
+ Auto focus cameras would not work well(?).
