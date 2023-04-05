#include "ros/ros.h"
#include "yolact_ros_msgs/Box.h"
#include "yolact_ros_msgs/Detection.h"
#include "yolact_ros_msgs/Detections.h"
#include "yolact_ros_msgs/Mask.h"
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


#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>






// L1 objects = {"poison", "infectious-substance", "non-flammable-gas", "inhalation-hazard"};
// L2 objects = {"corrosive", "dangerous", "flammable", "organic-peroxide"};
// L3 objects = {"explosive", "radioactive", "flammable-solid", "spontaneously-combustible", "oxygen"};

// some global variables
float currentx = 0.0;
float currenty = 0.0;
float old_framescore = 0.0;
float framescore = 0.0;
float dispersionvalue = 0.0;
float finalscore;


int lowscore_cnt = 0;
int highscore_cnt = 0;
int zero_cnt = 0;

std::ofstream detectionwrite;
std::ofstream experimentwrite;
std::vector<std::string> objects = {"laptop","backpack","cap","mask","wallet","cell phone","glasses","key","watch"};

fl::Engine* engine;


// struct of fuzzy score calculation
struct fuzzyscore
{
    int SHAlevel;
	// high, medium, low
    float fuzzy_degree[3];
	float SHAResultScore;
	// float dispersionResultScore;
};



// L1_high_mu, L1_high_sigma = 0, 0.5
// L1_medium_mu, L1_medium_sigma = 1.7, 0.75
// L1_low_mu, L1_low_sigma = 5, 1.8
// L2_high_mu, L2_high_sigma = 0, 1.2
// L2_medium_mu, L2_medium_sigma = 3, 1
// L2_low_mu, L2_low_sigma = 5, 1.4
// L3_high_mu, L3_high_sigma = 0, 2.8
// L3_medium_mu, L3_medium_sigma = 2.9, 0.6
// L3_low_mu, L3_low_sigma = 3.3, 0.2


// float hyper_param[3][3][2] = {
//     {{0, 0.5}, {5, 0.75}, {10, 1.8}},
//     {{0, 1.2}, {5, 1}, {10, 1.4}},
//     {{0, 2.8}, {5, 0.6}, {5, 0.2}}};

// float hyper_param_risk[3][3][2] = {
//     {{0, 0.5}, {1.7, 0.75}, {5, 1.8}},
//     {{0, 1.2}, {3, 1}, {5, 1.4}},
//     {{0, 2.8}, {2.9, 0.6}, {3.3, 0.2}}};


float hyper_param_SHA[3][2] = {
	{0, 2.85},
	{1, 5.25},
	{2, 10.25}
	
};



void gaussianass(int level, float input, float* scorearray)
{
	if(level == -1)
	{
		for (int i = 0; i<3;i++)
		{
			scorearray[i] = 0.0;
		}
	}
	// else if(input <= 1.5, level==0)
	// 	for (int i = 0; i<3;i++)
	// 	{
	// 		scorearray[i] = 0.2;
	// 	}
		
	// else if (input <= 5.8, level==1)
	// 	for (int i = 0; i<3;i++)
	// 	{
	// 		scorearray[i] = 0.1;
	// 	}
		
	// else if (input <= 5.1, level==2)
	// 	for (int i = 0; i<3;i++)
	// 	{
	// 		scorearray[i] = 0.05;
	// 	}
	else
	{	
		for (int i = 0; i<3;i++)
		{
			// scorearray[i] = exp(    (-1.0) * pow(input-hyper_param_SHA[i][0], 2.0)     /     (2* pow(hyper_param_SHA[i][1], 2.0))    ) /  ((pow(2*3.14, 0.5))*hyper_param_SHA[i][1]);
			scorearray[i] = exp(    (-1.0) * pow(input-hyper_param_SHA[i][0], 2.0)     /     (2* pow(hyper_param_SHA[i][1], 2.0))    ) /  ((pow(2*3.14, 0.5))*hyper_param_SHA[i][1]);
			// scorearray[i] = exp(    (-1.0) * pow(input-hyper_param_SHA[level-1][i][0], 2.0)     /     (2* pow(hyper_param_SHA[level-1][i][1], 2.0))    ) * (level*0.5+0.5) ;
			// scorearray[i] = exp(    (-1.0) * pow(hyper_param_risk[level-1][i][0], 2.0)     /     (5* pow(hyper_param_risk[level-1][i][1], 2.0))    ) * (level*1+1);
			//std::cout<< "mu:" << hyper_param[level-1][i][0] << "," << "sigma:" << hyper_param[level-1][i][1] << "," << "degree of membership:" << scorearray[i] << std::endl;
		}

	}
}


// float dispersion(float distance)
// {
// 	float sumup = 0; 
// 	float dispersionvalue = 0;
// 	float averagevalue = 0;
// 	for (int i=0; i<=distance.size(); i++)
// 	{
// 		sumup = distance*0.001 + sumup;
// 	}
// 	averagevalue = sumup/Detection.detections.size();
// 	dispersionvalue = pow(abs(distance - averagevalue),2);
// 	return dispersionvalue;
// };



int findLevel(const std::string& s1)
{
	int Level = -1;
	int idx = 0;
	std::vector<std::string>::iterator iter = find(objects.begin(), objects.end(), s1);
	idx = std::distance(objects.begin(), iter);
	// ROS_INFO("idx == %d", idx);
	if (idx<=1)
	{
		Level = 1;
	}
	else if (1<idx && idx<=4)
	{
		Level = 2;
	}
	else if (4<idx && idx<=8)
	{
		Level = 3;
	}
	else
	{
		ROS_INFO("Object not found!");
	}
	// ROS_INFO("Level == %d", Level);
	return Level;
}

// void processcallback(const yolact_ros_msgs::Detections Detection, const geometry_msgs::PoseWithCovarianceStamped currentpose) // comment out

// {
// 	// Get location 
// 	currentx = currentpose.pose.pose.position.x;
// 	currenty = currentpose.pose.pose.position.y;
// 	// Declaration
// 	std::vector<fuzzyscore> scores;
//     float scorearray[3];
// 	float test_framescore = 0.0;
//     for (int i =0; i<Detection.detections.size(); ++i)
//     {
//         fuzzyscore currentscore;
//         // Find level for all detections
//         int level = findLevel(Detection.detections[i].class_name.c_str());
//         gaussianass(level, Detection.detections[i].distance*2, scorearray);
// 		// Calculate degree of membership
//         currentscore.SHAlevel = level;
//         currentscore.fuzzy_degree[0] = scorearray[0];
//         currentscore.fuzzy_degree[1] = scorearray[1];
//         currentscore.fuzzy_degree[2] = scorearray[2];
// 		currentscore.SHAResultScore = currentscore.fuzzy_degree[0] * 50 +  currentscore.fuzzy_degree[1] * 10 + currentscore.fuzzy_degree[2] * 5;
//         scores.push_back(currentscore);
//     }
// 	// Calculate the score of the whole frame
// 	for(int i=0; i<scores.size();++i)
// 	{
// 		test_framescore += scores[i].SHAResultScore;
// 		detectionwrite << scores[i].SHAlevel<<"," <<Detection.detections[i].distance*2<<","<<test_framescore;
// 	}
// 	detectionwrite << '\n';

// 	// Remove outlier
// 	if (test_framescore >= 0) 
// 	{
// 		old_framescore = test_framescore;
// 		zero_cnt = 0;
// 	}
// 	else if (zero_cnt < 50)
// 	{
// 		test_framescore = old_framescore;
// 		zero_cnt++;
// 	}
// 	else
// 	{
// 		test_framescore = 0.0;
// 		zero_cnt = 0;
// 	}
// 	experimentwrite << currentx <<"," << currenty <<"," << test_framescore << '\n';
// 	ROS_INFO("x:%.2f, y:%.2f, score:%.2f", currentx, currenty, test_framescore);
	
// }

// Risk score display



// void variance(const perror& data)
// {
//     double sum = std::accumulate(std::begin(data), std::end(data), 0.0);
//     double mean = sum / data.size();

//     double variance = 0.0;
//     std::for_each(std::begin(data), std::end(data), [&](const double d) {
//         variance += pow(d-mean, 2);
//     });
//     variance /= data.size();

//     double std_deviation = sqrt(variance);

// }






void yolactcallback(const yolact_ros_msgs::Detections Detection)
{
	std::vector<fuzzyscore> SHAscores;
	// std::vector<fuzzyscore> dispersionScores;
	float framescore = 0.0;
	// float dispersionvalue = 0.0;
    float scorearray[3];
	float sumup = 0.0; 
	float mean = 0.0;
	float variance = 0.0;
	float distance = 0.0;

    
	

	if (Detection.detections.size()<=1)
	{
		// fuzzyscore currentdispersionscore;
		fuzzyscore currentSHAscore;
	

		for (int i =0; i<Detection.detections.size(); ++i)
   		{
		

		int level = findLevel(Detection.detections[i].class_name.c_str());
		// ROS_INFO("%d", level);
		// ROS_INFO("%.2f", Detection.detections[i].distance);
        gaussianass(level, Detection.detections[i].distance*0.001, scorearray);


        
        currentSHAscore.SHAlevel = level;
        currentSHAscore.fuzzy_degree[0] = scorearray[0];
        currentSHAscore.fuzzy_degree[1] = scorearray[1];
        currentSHAscore.fuzzy_degree[2] = scorearray[2];
		// ROS_INFO("%.2f, %.2f,%.2f",currentscore.fuzzy_degree[0], currentscore.fuzzy_degree[1],currentscore.fuzzy_degree[2]);
		currentSHAscore.SHAResultScore = currentSHAscore.fuzzy_degree[0] * 50 +  currentSHAscore.fuzzy_degree[1] * 10 + currentSHAscore.fuzzy_degree[2] * 5;
        SHAscores.push_back(currentSHAscore);
		
		}
		dispersionvalue = 0;
	}		

	else
	{
		fuzzyscore currentSHAscore;
		// fuzzyscore currentdispersionscore;
		for (int i =0; i<Detection.detections.size(); ++i)
    	{
		

		int level = findLevel(Detection.detections[i].class_name.c_str());
		// ROS_INFO("%d", level);
		// ROS_INFO("%.2f", Detection.detections[i].distance);
        gaussianass(level, Detection.detections[i].distance*0.001, scorearray);


        
        currentSHAscore.SHAlevel = level;
        currentSHAscore.fuzzy_degree[0] = scorearray[0];
        currentSHAscore.fuzzy_degree[1] = scorearray[1];
        currentSHAscore.fuzzy_degree[2] = scorearray[2];
		// ROS_INFO("%.2f, %.2f,%.2f",currentscore.fuzzy_degree[0], currentscore.fuzzy_degree[1],currentscore.fuzzy_degree[2]);
		currentSHAscore.SHAResultScore = currentSHAscore.fuzzy_degree[0] * 50 +  currentSHAscore.fuzzy_degree[1] * 10 + currentSHAscore.fuzzy_degree[2] * 5;
        SHAscores.push_back(currentSHAscore);

		distance = Detection.detections[i].distance*0.001; //dispersion calculation
		sumup += distance;
    	
		
		}


		mean = sumup / Detection.detections.size(); //dispersion calculation
		
		
		for (int i=0; i<Detection.detections.size(); i++)
		{
			variance += pow(Detection.detections[i].distance*0.001 - mean, 2);
		}
		
		
		dispersionvalue = variance/Detection.detections.size();
		
	}	
	
	for(int i=0; i<SHAscores.size();++i)
	{
		// find the max of scores[i].score, and it's position
		framescore += SHAscores[i].SHAResultScore;
	}
	
	
	
	

	if (framescore >= 0) 
	{
		old_framescore = framescore;
		zero_cnt = 0;
	}
	else if (zero_cnt < 20)
	{
		framescore = old_framescore;
		zero_cnt++;
	}
	else
	{
		framescore = 0.0;
		zero_cnt = 0;
	}




	experimentwrite << old_framescore << ","<<dispersionvalue <<'\n';
	ROS_INFO("SHA score:%.2f", old_framescore);
	ROS_INFO("dispersion value:%.2f", dispersionvalue);
}





int main(int argc, char *argv[])
{
	//////////////////////////////////////////////////////////
	//fuzzy lite////

	using namespace fl;

	fl::Engine* engine = new fl::Engine;
	engine->setName("fuzzytest");
	engine->setDescription("");

	fl::InputVariable* SHAScore = new fl::InputVariable;
	SHAScore->setName("SHAScore");
	SHAScore->setDescription("");
	SHAScore->setEnabled(true);
	SHAScore->setRange(0.000, 100.000);
	SHAScore->setLockValueInRange(true);
	SHAScore->addTerm(new fl::Trapezoid("Low", 0.000, 0.000, 10.000, 40.000));
	SHAScore->addTerm(new fl::Triangle("Medium", 20.000, 50.000, 80.000));
	SHAScore->addTerm(new fl::Trapezoid("High", 60.000, 90.000, 100.000, 100.000));
	engine->addInputVariable(SHAScore);

	fl::InputVariable* Distancetoeachother = new fl::InputVariable;
	Distancetoeachother->setName("Distancetoeachother");
	Distancetoeachother->setDescription("Distance");
	Distancetoeachother->setEnabled(true);
	Distancetoeachother->setRange(0.000, 10.000);
	Distancetoeachother->setLockValueInRange(true);
	Distancetoeachother->addTerm(new fl::Gaussian("Close", 0.000, 2.000));
	Distancetoeachother->addTerm(new fl::Gaussian("Medium", 5.000, 1.500));
	Distancetoeachother->addTerm(new fl::Gaussian("Far", 10.000, 2.000));
	engine->addInputVariable(Distancetoeachother);

	fl::OutputVariable* Possibility = new fl::OutputVariable;
	Possibility->setName("Possibility");
	Possibility->setDescription("Possibility");
	Possibility->setEnabled(true);
	Possibility->setRange(0.000, 1.000);
	Possibility->setLockValueInRange(false);
	Possibility->setAggregation(new fl::AlgebraicSum);
	Possibility->setDefuzzifier(new fl::Bisector(100));
	Possibility->setDefaultValue(fl::nan);
	Possibility->setLockPreviousValue(false);
	Possibility->addTerm(new fl::Triangle("LP", 0.000, 0.200, 0.400));
	Possibility->addTerm(new fl::Triangle("MP", 0.300, 0.500, 0.700));
	Possibility->addTerm(new fl::Triangle("HP", 0.600, 0.800, 1.000));
	engine->addOutputVariable(Possibility);

	fl::RuleBlock* ruleBlock = new fl::RuleBlock;
	ruleBlock->setName("");
	ruleBlock->setDescription("");
	ruleBlock->setEnabled(true);
	ruleBlock->setConjunction(new fl::AlgebraicProduct);
	ruleBlock->setDisjunction(new fl::AlgebraicSum);
	ruleBlock->setImplication(new fl::AlgebraicProduct);
	ruleBlock->setActivation(new fl::Highest);
	ruleBlock->addRule(fl::Rule::parse("if SHAScore is Low and Distancetoeachother is Close then Possibility is MP", engine));
	ruleBlock->addRule(fl::Rule::parse("if SHAScore is Low and Distancetoeachother is Medium then Possibility is LP", engine));
	ruleBlock->addRule(fl::Rule::parse("if SHAScore is Low and Distancetoeachother is Far then Possibility is LP", engine));
	ruleBlock->addRule(fl::Rule::parse("if SHAScore is Medium and Distancetoeachother is Close then Possibility is MP", engine));
	ruleBlock->addRule(fl::Rule::parse("if SHAScore is Medium and Distancetoeachother is Medium then Possibility is MP", engine));
	ruleBlock->addRule(fl::Rule::parse("if SHAScore is Medium and Distancetoeachother is Far then Possibility is LP", engine));
	ruleBlock->addRule(fl::Rule::parse("if SHAScore is High and Distancetoeachother is Close then Possibility is HP", engine));
	ruleBlock->addRule(fl::Rule::parse("if SHAScore is High and Distancetoeachother is Medium then Possibility is HP", engine));
	ruleBlock->addRule(fl::Rule::parse("if SHAScore is High and Distancetoeachother is Far then Possibility is MP", engine));
	engine->addRuleBlock(ruleBlock);
	
	
	
	
	
	///////////////////////////////////////////////////////
	
	// Open file X,Y,level, distance ...
	// detectionwrite.open ("detection.csv");
	// std::cout<< "write to detection.csv" << std::endl;
	experimentwrite.open ("experiment.csv");
	std::cout<< "write to experiment.csv" << std::endl;

	// Init ROS
	ros::init(argc, argv, "fuzzyass");
	ROS_INFO("Start SHA evaluation, waiting for detections result...");
	ros::NodeHandle nh;

	// Only subscribe to detections messages, this can be used for testing.
	ros::Subscriber sub = nh.subscribe<yolact_ros_msgs::Detections>("/yolact_ros/detections", 1, yolactcallback);
	
	// ros::Subscriber detection_sub = nh.subscribe<yolact_ros_msgs::Detections>("/yolact_ros/detections", 1, processcallback);
	// ros::Subscriber pose_sub = nh.subscribe<geometry_msgs::PoseWithCovarianceStamped>("/amcl_pose", 1, processcallback);
	
	ros::Publisher vel_pub = nh.advertise<geometry_msgs::Twist>("/jackal_velocity_controller/cmd_vel",10);
	geometry_msgs::Twist zero_cmd;
	zero_cmd.linear.x = 0.0;
	zero_cmd.linear.y = 0.0;
	zero_cmd.linear.z = 0.0;
	zero_cmd.angular.x = 0.0;
	zero_cmd.angular.y = 0.0;
	zero_cmd.angular.z = 0.0;

	// Score GUI
	image_transport::ImageTransport imgt(nh);
	image_transport::Publisher scoreImgpub = imgt.advertise("SHA/score",1);
	
	// Create Approximated synchronized subscribers subscribes to position and detections topic
  	message_filters::Subscriber<geometry_msgs::PoseWithCovarianceStamped> pose_sub( nh, "/amcl_pose", 1);
	message_filters::Subscriber<yolact_ros_msgs::Detections> detection_sub( nh, "/yolact_ros/detections", 1);

	typedef message_filters::sync_policies::ApproximateTime<yolact_ros_msgs::Detections, geometry_msgs::PoseWithCovarianceStamped> MySyncPolicy;
  	message_filters::Synchronizer<MySyncPolicy> sync(MySyncPolicy(10), detection_sub, pose_sub);	
	// sync.registerCallback(&processcallback);

	//cv::Mat image(100, 300, CV_8UC3, cv::Scalar(0));
	// Start wating for the publisher
	while(ros::ok())
	{
		ros::spinOnce(); 
		
		
		
		engine -> setInputValue("Distancetoeachother", dispersionvalue);  // Fuzzy engine
		engine -> process();
		// FL_LOG("Decision = " << fl::Op::str(engine ->getOutputValue("Possibility") ) );
		finalscore = engine -> getOutputValue("Possibility");
		OutputVariable* Evaluation  = engine -> getOutputVariable("Possibility");
		







		
		// if (finalscore > 0.8)
		// {
		// 	highscore_cnt ++;
			
		// 	if (highscore_cnt > 15)
		// 	{
		// 		lowscore_cnt = 0;
		// 		std::string victimwarning = "Victim warning! SHA score:" + std::to_string(int(old_framescore)) + " Dispersion value: " + std::to_string(double(dispersionvalue)) + " Decision:" + Op::str(Evaluation->getValue());
		// 		cv::Mat image(400, 1000, CV_8UC3, cv::Scalar(0));
		// 		cv::putText(image, //target image
        //     	victimwarning, //text
        //     	cv::Point(10, image.rows / 2), //MIDDLE position
        //     	cv::FONT_HERSHEY_DUPLEX,
        //     	1.0, //size
        //     	CV_RGB(255, 0, 0), //font color
        //     	1 //thick ness
        //     	);
		// 		// std::cout<<"Victim warning, SHA score is:"<<std::to_string(int(old_framescore))<<std::endl;
		// 		vel_pub.publish(zero_cmd);
		// 		sensor_msgs::ImagePtr scoreImgmsg=cv_bridge::CvImage(std_msgs::Header(), "bgr8", image).toImageMsg();
		// 		scoreImgpub.publish(scoreImgmsg);
				
		// 	}
			
		// }
		// else
		// {
		// 	lowscore_cnt ++;
			
			
		// 	if (lowscore_cnt > 30)
		// 	{
		// 		highscore_cnt = 0;
		// 		std::string scoreString = "SHA score: " + std::to_string(int(old_framescore)) + " Dispersion value: " + std::to_string(double(dispersionvalue)) + " Decision:" + Op::str(Evaluation->getValue());
    	// 		cv::Mat image(400, 1000, CV_8UC3, cv::Scalar(0));
		// 		cv::putText(image, //target image
        // 		scoreString, //textold_framescore
        // 		cv::Point(10, image.rows / 2), //MIDDLE position
        // 		cv::FONT_HERSHEY_DUPLEX,
        //     		1.0, //size
        //     	CV_RGB(255, 0, 0), //font color
        //     	1 //thick ness
        //     	);
		// 		sensor_msgs::ImagePtr scoreImgmsg=cv_bridge::CvImage(std_msgs::Header(), "bgr8", image).toImageMsg();
		
		// 		scoreImgpub.publish(scoreImgmsg);
		// 	}
		// }



			
			
		if (old_framescore > 15)
		{
			highscore_cnt ++;
			
			if (highscore_cnt>10)
			{	
				lowscore_cnt = 0;
				// std::string victimwarning = "Victim warning! SHA score:" + std::to_string(int(old_framescore)) + " Dispersion value: " + std::to_string(float(dispersionvalue)) + " Decision:" + Op::str(Evaluation->getValue());
				std::string victimwarning = "Victim warning! SHA score:" + std::to_string(int(old_framescore)) + " Dispersion value: " + std::to_string(float(dispersionvalue)) ;
				cv::Mat image(400, 1000, CV_8UC3, cv::Scalar(0));
				cv::putText(image, //target image
            	victimwarning, //text
            	cv::Point(10, image.rows / 2), //MIDDLE position
            	cv::FONT_HERSHEY_DUPLEX,
            	1.0, //size
            	CV_RGB(255, 255, 0), //font color
            	1 //thick ness
            	);
				// std::cout<<"Victim warning, SHA score is:"<<std::to_string(int(old_framescore))<<std::endl;
				vel_pub.publish(zero_cmd);
				sensor_msgs::ImagePtr scoreImgmsg=cv_bridge::CvImage(std_msgs::Header(), "bgr8", image).toImageMsg();
				scoreImgpub.publish(scoreImgmsg);
				
			}
		}
			
		
		else
		{
			lowscore_cnt ++;
			
			
			if (lowscore_cnt > 10)
			{
				highscore_cnt = 0;
				// std::string scoreString = "SHA score: " + std::to_string(int(old_framescore)) + " Dispersion value: " + std::to_string(float(dispersionvalue)) + " Decision:" + Op::str(Evaluation->getValue());
				std::string scoreString = "SHA score: " + std::to_string(int(old_framescore)) + " Dispersion value: " + std::to_string(float(dispersionvalue));
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
			}
		}
			

			










	}

	// End of the program
	// detectionwrite.close();
	// std::cout<< "detection.csv finish" << std::endl;
	experimentwrite.close();
	std::cout<< "experimentwrite.csv finish" << std::endl;

	std::cout<< "SHA evaluation end" << std::endl;
	return 0;


}
