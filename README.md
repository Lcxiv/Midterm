# Midterm

## *Goal* 
The purpose of this project is to analyze data from an aim trainer named "Kovaak." The objective is to extract the data, clean the results and compare it 
to different games. By comparing the data from this aim trainer, one may be able to determine if aim trainers are beneficial or not (and to 
which extent) in different games. Right now, the project is only extracting the data from Kovaak and is not extracting any other game. If you have any idea on what could be done better or added to this project, feel free to email me at condevaux@chapman.edu. Thank you! :) 

## *Data*

The data provided comes from my own end. I played different aim training scenarios for the past months to gather as much as I could. I tried to stay as consistent as possible to not skew the data too much. The scenarios are classified as tracking, aiming, or both. As of now, the two scenarios are a mix of these two. I only focus on accuracy from the whole data available since I consider it the main element to look at. Accuracy was calculed by the number of targets hit and missed for one scenario played.

## *Files And Scripts*

- README.md
- Midtermproj.Rproj
- rename.sh
- Scripts folder
  - Graphs.R
  - functions.R
  - data_cleaning.R
- stats folder
  - "name_of_the_scenario_ + date-Played.csv" as the format.
- Write_up.Rmd

The project contains an R project that one can open directly. "The main script is labeled "data_cleaning.R", it contains the main calculations and plots."data_cleaning.R" contains the main data formatting and calculations while "functions.R" stores the functions used in this project. "Graphs.R" could be considered as a little main with the display of the data. 
The second script "rename.sh" is "hidden" in the "stats" folder is a one time script to format the filenames before using them. It has to be used with caution since using it again will reformat the names based on the same rules. 
The "stats" folder contains all the data used for this project.
Read the write up if you're interested to learn a bit more about the project as well.

## *How to run the project*

Download the zip file from the github or clone the project from the url.
Open the "Midterm.Rproj" and source Graphs.R
You do not need to install or load any library since it will be done automatically for you. Wait for the results to appear in the form of plots.

## *Future Goals*

Divide main script into subscripts containing calculations and more. Add different games to compare stats either by collecting data from computer or online.
Add more graphs to show different aspects of the data and more insight.

## *Updates*

- Fixed the Readme.md

- Refactored some of the code by adding a functions.r file

- Could not fix the parsing issues without loosing all the data. I think this was created because of their weird format and the way I had to manipulate the data in many different ways. Therefore I lost some data but I could only compromise there.

- Added more explanation in the Write_up.md concerning the data and the trends.

- Added a test folder and tried to add a test but did not work.

- You may need to run the final graph on its own, I cannot figure why the behavior is inconistent with it.






