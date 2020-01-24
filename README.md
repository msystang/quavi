# QUAVI
#### (pronounced KWEY-VEE)

## Introduction
#### Problem Statement
Being in a new city is intimidating when you don’t know much about it. You’re in a strange new world, lost, and you just want somewhere to start. There are guided tours, but they can be costly and inflexible in terms of time and the points of interests. You could look up locations on a map, but in a busy place like NYC, it’s sometimes hard to find what you’re actually looking for whether you’re hungry or want some history.

#### Solution
Quavi makes exploring a new city easier and catered to the individual’s experience. Our app would allow a user to be their own interactive tour guide at their own leisure with no cost to them. Users have the option to select and download preset tour routes based on the categories that interest them (i.e. History, Arts & Culture, Religion, Food, etc). This eliminates the need to meticulously plan out their sightseeing course from scouring through multiple resources.

## Technologies
1. Swift 5
1. MapBox (including AR and Machine Learning capabilities)
1. CoreLocation
1. Google Firebase
1. Kingfisher

## Usage Example
- The user is presented with the map loaded on the screen and on the bottom is the “Map” tab and “Profile” tab at the bottom of the screen:
  - The map will include a collection of route categories that the user can select from
  - The user can select a category which will plot annotations on the map for the tour
  - Additionally there will be a list of all the stops for a selected category
  - The user can tap an option to expand the section in order to display images and information about that stop
  - Tapping again on the section will collapse the cell and hide the information about that stop
  - If the user selects a category, it will change the stops and all  information associated with it

- On a selected tour when the GO button is pressed, the map leads the user to the first stop

- Upon arrival to the first stop, the app will notify the user that they have arrived and alert them to start the tour

- They will be presented with a pop up window that the user can swipe to get more information about the point of interest.  I.e {Text Info, images & more}

- Users can save a point of interest to their profile by clicking the like button. 

- The app will automatically lead users to the next tour site after a point of interest is visited.

- When the tour is completed a congratulation pop up with confetti with load. With other tours presented to them and the option to save or share the tour.

- The “Profile” tab will allow users to update/edit their profile info and view their saved tours and points of interested


## GIFs & Images
Coming Soon!


## Contributors
- Project Manager - [Sunni Tang](https://github.com/msystang)
- Tech Lead - [Ayoola Abudu](https://github.com/aabudu16)
- UI - [Rad Valogno](https://github.com/RadBV)
- Git Master - [Alexander George Legaspi](https://github.com/aglegaspi)

