#include "ros/ros.h"
#include "fuzzy_ass/sha.h"
#include "std_msgs/String.h"
#include <sstream>
#include <cmath>
#include <string>
#include <vector> 
#include <algorithm>
#include "geometry_msgs/PoseWithCovarianceStamped.h"
#include "geometry_msgs/Twist.h"
#include "fl/Headers.h"
#include <message_filters/time_synchronizer.h>
#include <message_filters/subscriber.h>
#include <message_filters/synchronizer.h>
#include <message_filters/sync_policies/approximate_time.h>
#include <numeric>
#include <iostream>
#include <fstream>
#include <tuple>

#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>

float final_score;

int lowscore_cnt = 0;
int highscore_cnt = 0;


struct env_complexity_score
{
    float SHAscore;
	float Lasernoisescore;
	float Riskscore;
    float Radiationscore;
    float final_complexity_score;
    float positive_score;
    float negative_score;
};


void env_complexitycallback(const fuzzy_ass::sha)
{
    env_complexity_score complexity_score;
    complexity_score.SHAscore = sha.old_framescore;
    complexity_score.Lasernoisescore = 0;
    complexity_score.Riskscore = 0;
    complexity_score.Radiationscore = 0;
    
    complexity_score.positive_score = complexity_score.SHAscore;
    complexity_score.negative_score = -(complexity_score.Lasernoisescore + complexity_score.Riskscore + complexity_score.Radiationscore);

    complexity_score.final_complexity_score = complexity_score.negative_score + complexity_score.positive_score;

    final_score = complexity_score.final_complexity_score


}


int main(int argc, char *argv[])
{

	
	experimentwrite.open ("env_complexity.csv");
	std::cout<< "write to env_complexity.csv" << std::endl;

	// Init ROS
	ros::init(argc, argv, "env_complexity");
	ROS_INFO("Start environment complexity evaluation, waiting for detections result...");
	ros::NodeHandle nh;

	// Only subscribe to detections messages, this can be used for testing.
	ros::Subscriber sub = nh.subscribe<fuzzy_ass_msgs::sha>("/sha", 1, env_complexitycallback);
	
	// ros::Subscriber detection_sub = nh.subscribe<yolact_ros_msgs::Detections>("/yolact_ros/detections", 1, processcallback);
	// ros::Subscriber pose_sub = nh.subscribe<geometry_msgs::PoseWithCovarianceStamped>("/amcl_pose", 1, processcallback);
	

    ros::Publisher env_complexity_pub = nh.advertise<std_msgs::float>("environment_complecity", 10);

	// ros::Publisher vel_pub = nh.advertise<geometry_msgs::Twist>("/jackal_velocity_controller/cmd_vel",10);
	// geometry_msgs::Twist zero_cmd;
	// zero_cmd.linear.x = 0.0;
	// zero_cmd.linear.y = 0.0;
	// zero_cmd.linear.z = 0.0;
	// zero_cmd.angular.x = 0.0;
	// zero_cmd.angular.y = 0.0;
	// zero_cmd.angular.z = 0.0;

	// Score GUI
	image_transport::ImageTransport imgt(nh);
	image_transport::Publisher scoreImgpub = imgt.advertise("env_complexity/score",1);
	
	// Create Approximated synchronized subscribers subscribes to position and detections topic
  	// message_filters::Subscriber<geometry_msgs::PoseWithCovarianceStamped> pose_sub( nh, "/amcl_pose", 1);

	// typedef message_filters::sync_policies::ApproximateTime<yolact_ros_msgs::Detections, geometry_msgs::PoseWithCovarianceStamped> MySyncPolicy;
  	// message_filters::Synchronizer<MySyncPolicy> sync(MySyncPolicy(10), detection_sub, pose_sub);	
	// sync.registerCallback(&processcallback);

	//cv::Mat image(100, 300, CV_8UC3, cv::Scalar(0));
	// Start wating for the publisher
	while(ros::ok())
	{
		ros::spinOnce(); 
		
        std::string victimwarning = "Environment Complexity:" + std::to_string(float(final_score)) ;
		cv::Mat image(400, 1000, CV_8UC3, cv::Scalar(0));
		cv::putText(image, //target image
           	victimwarning, //text
    	cv::Point(10, image.rows / 2), //MIDDLE position
      	cv::FONT_HERSHEY_DUPLEX,
           	1.0, //size
         	CV_RGB(255, 255, 0), //font color
           	1 //thick ness
          	);
				
		vel_pub.publish(zero_cmd);
		sensor_msgs::ImagePtr scoreImgmsg=cv_bridge::CvImage(std_msgs::Header(), "bgr8", image).toImageMsg();
    	scoreImgpub.publish(scoreImgmsg);
		


			

		

	}

	// End of the program
	// detectionwrite.close();
	// std::cout<< "detection.csv finish" << std::endl;
	experimentwrite.close();
	std::cout<< "env_complexity.csv finish" << std::endl;

	std::cout<< "environment complexity evaluation end" << std::endl;
	return 0;


}