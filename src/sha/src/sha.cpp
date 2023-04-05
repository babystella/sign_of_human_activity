#include "ros/ros.h"
#include "yolact_ros_msgs/Box.h"
#include "yolact_ros_msgs/Detection.h"
#include "yolact_ros_msgs/Detections.h"
#include "yolact_ros_msgs/Mask.h"
#include "std_msgs/String.h"
#include "std_msgs/Float32.h"
#include "std_msgs/Int32.h"
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


// global variables
float old_framescore = 0.0;
float old_variance = 0.0;
float framescore = 0.0;
float total_variance = 0.0;
float finalscore;

//
int lowscore_cnt = 0;
int highscore_cnt = 0;
int zero_cnt = 0;

std::ofstream detectionwrite;
std::ofstream experimentwrite;
std::vector<std::string> objects = {"laptop","backpack",
									"cap","mask","wallet",
									"cell phone","glasses","key","watch"};
// struct of fuzzy score calculation
struct SHAparameter
{
    int SHAlevel;
	float SHAResultScore;
	float SHAweight;
};




// Give weight to different objects of class

std::tuple<int,float> find_level_wight(const std::string& s1)
{
	
	std::tuple<int,float> level_weight;
	int Level = -1;
	int idx = 0;
	float weight = 0;
	std::vector<std::string>::iterator iter = find(objects.begin(), objects.end(), s1);
	idx = std::distance(objects.begin(), iter);
	// ROS_INFO("idx == %d", idx);
	if (idx<=1)
	{
		level_weight = std::make_tuple(1, 0.16);
		
		// Level = 1;
		// weight = 0.33;
	}
	else if (1<idx && idx<=4)
	{
		level_weight = std::make_tuple(2, 0.49);
		// Level = 2;
		// weight = 0.66;
	}
	else if (4<idx && idx<=8)
	{
		level_weight = std::make_tuple(3, 0.82);
		// Level = 3;
		// weight = 1;
	}
	else
	{
		ROS_INFO("Object not found!");
	}
	// ROS_INFO("Level == %d", Level);
	// level_weight = std::make_tuple(Level, weight);
	return level_weight;
}



void yolactcallback(const yolact_ros_msgs::Detections Detection)
{
	std::vector<SHAparameter> SHAscores;
	float framescore = 0.0;
	float variance[Detection.detections.size()];
	float sumup = 0.0; 
	float mean = 0.0;
	float distance = 0.0;
	float weight = 0.0;
	int level = 0;
	float total_variance = 0;
    float norm_framescore = 0;
	
	// different occasions when number of detetections vary
	if (Detection.detections.size() == 0)	
	{
		total_variance = 0;
		old_framescore = 0;
	}

	else if (Detection.detections.size() == 1)
	{
		// SHAparameter currentdispersionscore;
		SHAparameter currentSHAscore;
		std::tuple<int, float> level_weight = find_level_wight(Detection.detections[0].class_name.c_str());
		std::tie(level, weight) = level_weight;

			

        
        currentSHAscore.SHAlevel = level;

		currentSHAscore.SHAResultScore = currentSHAscore.SHAweight;
		framescore = currentSHAscore.SHAweight;
		

		SHAscores.push_back(currentSHAscore);
		
		
		total_variance = 0;
	
		norm_framescore = 1/(1+exp((-10)*(framescore-0.5)));
		// dispersionvalue = 0;
	}		

	else
	{
		SHAparameter currentSHAscore;
		// SHAparameter currentdispersionscore;
		for (int i =0; i<Detection.detections.size(); ++i)
   		{
			distance =  Detection.detections[i].distance*0.001; //dispersion calculation
 			sumup += distance;
			std::tuple<int, float> level_weight = find_level_wight(Detection.detections[i].class_name.c_str());
			std::tie(level, weight) = level_weight;
			currentSHAscore.SHAlevel = level;
			currentSHAscore.SHAweight = weight;
		}
		mean = sumup / Detection.detections.size();
		// generate total variance
		for (int i=0; i<Detection.detections.size(); i++)
		{
			variance[i] = abs(Detection.detections[i].distance*0.001 - mean);
			total_variance = total_variance + variance[i];
		
			currentSHAscore.SHAlevel = level;
			currentSHAscore.SHAweight = weight;
        	framescore += currentSHAscore.SHAweight * (10-variance[i])/10;

			SHAscores.push_back(currentSHAscore);
			
		}
		norm_framescore = 1/(1+exp((-10)*(framescore-0.5)));

	}	
	
	// score filter to remove unreliable score
	if (norm_framescore !=0)// have detections
	{
		old_framescore = norm_framescore;
		old_variance = total_variance;
		zero_cnt = 0;
	}
	else if (zero_cnt < 20) // no detection under 20
	{
		zero_cnt++;
		norm_framescore = old_framescore;
		total_variance = old_variance;
	}
	else// no detection over 20
	{
		old_framescore = 0.0;
		old_variance = 0.0;
		zero_cnt = 0;
	}


	experimentwrite << old_framescore << ","<< old_variance <<"," << Detection.detections.size() << '\n';
	ROS_INFO("SHA score:%.5f", old_framescore);
	ROS_INFO("dispersion value:%.5f", old_variance);
}



int main(int argc, char *argv[])
{
	experimentwrite.open ("experiment.csv");
	std::cout<< "write to experiment.csv" << std::endl;

	// Init ROS
	ros::init(argc, argv, "sha");
	ROS_INFO("Start SHA evaluation, waiting for detections result...");
	ros::NodeHandle nh;

	std_msgs::Float32 old_framescore_pub;
	std_msgs::Float32 old_variance_pub;


	// Only subscribe to detections messages, this can be used for testing.
	ros::Subscriber sub = nh.subscribe<yolact_ros_msgs::Detections> ("/yolact_ros/detections", 1, yolactcallback);
	ros::Publisher sha_pub = nh.advertise<std_msgs::Float32> ("/shascore",10);
	
	


	// Score GUI
	image_transport::ImageTransport imgt(nh);
	image_transport::Publisher scoreImgpub = imgt.advertise("/sha/score",1);
	
	// Create Approximated synchronized subscribers subscribes to position and detections topic
  	message_filters::Subscriber<geometry_msgs::PoseWithCovarianceStamped> pose_sub( nh, "/amcl_pose", 1);
	message_filters::Subscriber<yolact_ros_msgs::Detections> detection_sub( nh, "/yolact_ros/detections", 1);

	typedef message_filters::sync_policies::ApproximateTime<yolact_ros_msgs::Detections, geometry_msgs::PoseWithCovarianceStamped> MySyncPolicy;
  	message_filters::Synchronizer<MySyncPolicy> sync(MySyncPolicy(10), detection_sub, pose_sub);	

	while(ros::ok())
	{
		ros::spinOnce(); 
		// set the threshod for warning
		if (old_framescore > 0.9)
		{
			highscore_cnt ++;
			
			if (highscore_cnt>10)
			{	
				lowscore_cnt = 0;
	
				std::string victimwarning = "Victim warning! SHA score:" + std::to_string(float(old_framescore)) + " Dispersion value: " + std::to_string(float(old_variance)) ;
				old_framescore_pub.data = old_framescore;
				old_variance_pub.data = old_variance;
				cv::Mat image(400, 1000, CV_8UC3, cv::Scalar(0));
				cv::putText(image, //target image
            	victimwarning, //text
            	cv::Point(10, image.rows / 2), //MIDDLE position
            	cv::FONT_HERSHEY_DUPLEX,
            	1.0, //size
            	CV_RGB(255, 255, 0), //font color
            	1 //thick ness
            	);
				
				sensor_msgs::ImagePtr scoreImgmsg=cv_bridge::CvImage(std_msgs::Header(), "bgr8", image).toImageMsg();
				scoreImgpub.publish(scoreImgmsg);
				sha_pub.publish(old_framescore_pub);	//SHA score publication
				// sha_pub.publish(old_variance_pub);	//dispersion publication
			}
		}
			
		
		else
		{
			lowscore_cnt ++;
			
			
			if (lowscore_cnt > 10)
			{
				highscore_cnt = 0;
				
				std::string scoreString = "SHA score: " + std::to_string(float(old_framescore)) + " Dispersion value: " + std::to_string(float(old_variance));
				old_framescore_pub.data = old_framescore;
				old_variance_pub.data = old_variance;
    			cv::Mat image(400, 1000, CV_8UC3, cv::Scalar(0));
				cv::putText(image, //target image
        		scoreString, //textold_framescore
        		cv::Point(10, image.rows / 2), //MIDDLE position
        		cv::FONT_HERSHEY_DUPLEX,
            		1.0, //size
            	CV_RGB(255, 0, 0), //font color
            	1 //thick ness
            	);
				sensor_msgs::ImagePtr scoreImgmsg=cv_bridge::CvImage(std_msgs::Header(), "bgr8", image).toImageMsg();
		
				scoreImgpub.publish(scoreImgmsg);
				sha_pub.publish(old_framescore_pub);	//SHA score publication
				// sha_pub.publish(old_variance_pub); 	//dispersion publication
			}
		}
			

		

	}

	
	experimentwrite.close();
	std::cout<< "experimentwrite.csv finish" << std::endl;
	std::cout<< "SHA evaluation end" << std::endl;
	return 0;


}