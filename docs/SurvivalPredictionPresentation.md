Developing Data Products: Survival Prediction Presentation
========================================================
author: Martina
date: Sun Sep 11 17:19:11 2016

Introduction
========================================================

Have you ever wondered if you would have surived a trip on the Titanic?
Well, now it is time to find out! 

For the course 'Developing Data Products' on Coursera, an app is created to help you find out if you would have survived the Titanic!



Would you have survived?
========================================================
To be able to determine wether or not someone would surive the Titanic, the app uses a prediction model.
The data used for this prediction model can be found here:

https://github.com/caesar0301/awesome-public-datasets/blob/master/Datasets/titanic.csv.zip

The app requires information about your sex, your age, the people you travel with, the class of your ticket and where you would have embarked. 

Using this information, the prediction model compares you to the actual passengers of the Titanic. 


Prediction Model
========================================================
Using a decision tree with  cross validation, a prediction model is created. 
This will determine wheter or not you would have survived the Titanic.

![plot of chunk unnamed-chunk-1](SurvivalPredictionPresentation-figure/unnamed-chunk-1-1.png) 



Try it out for yourself!
========================================================

The app can be found here:

https://martinalh.shinyapps.io/SurvivalPrediction/


The source code for ui.R and server.R files are available on the GitHub:

https://github.com/MartinaLH/Coursera-DataProducts-CourseProject
