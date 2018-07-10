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
### (3. Modify the script file)
You need to fix your webcam in the script file(run_docker.sh).  
+ Using your webcam  
Make sure line 13 "--device=/dev/video1:/dev/video0 \".
+ Using just bagfile, not your webcam  
Delete line 13.
### 4. Set a permission for the shell script
		$ chmod 755 run_docker.sh
### 5. Get into the container
		($ cd ~/docker_ws/lsdslam)
		$ ./run_docker.sh lsdslam:latest	//use your image name insted of "lsdslam:latest"
### 6. Run
#### 6-a. live_slam with your webcam

		//Inside of the container
		($ cd /home/rosbuild_ws)
		$ ./live_slam
#### 6-b. slam with the test bagfile from http://vmcremers8.informatik.tu-muenchen.de/lsd/LSD_room.bag.zip

		//Inside of the container
		($ cd /home/rosbuild_ws)
		$ ./testbag_slam
#### 6-c. slam with your own bagfile  
You need to set your bagfile inside of a directory which has the Dockerfile.  
And delete "#" at line 157 of Dockerfile like below, then build.  

@Dockerfile  
157 COPY  bagbag.bag /home/rosbuild_ws/package_dir/lsd_slam	//use your bagfile name instead of "bagbag.bag"

		//Inside of the container
		($ cd /home/rosbuild_ws)
		$ ./ownbag_slam
### 7. Quit
Ctrl+c → Ctrl+d
## Other things
+ You should swap "camera.yaml" depending on your webcam.  
You can get it by camera_calibration from ROS.
+ Wide view cameras would be better.
+ Global shutter is recomended(CCD cameras).
+ Auto focus cameras would not work well(?).
