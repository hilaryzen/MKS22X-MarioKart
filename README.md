# MKS22X-MarioKart
APCS Semester 2 Final Project

# Description

# How to Run

# Development Log

5/16

Hilary: Added map

5/20

Kayla: Wrote Kart class and began working on movement

Hilary: Added to Kart class and researched finding the color of an image

5/21

Kayla: I started to experiment with keys.  I got the map moving based on whether the user clicks w, a, s, or d.

Hilary: I started the Player class and wrote isOnRoad for the Kart class, which checks if the image below it is green.

5/22

Kayla: After the simple movements, I turned to rotations.  The map should now be rotating left or right based on the keys r and t.  I spawned a kart and adjusted the initial coordinates for the image so that it would zoom in on the starting line.

Hilary: I added variables and methods to the Image class so that each map could store its starting and ending points for the karts, and the values of the green field. I stored coordinates in arrays and tried to generalize our code so that eventually we can use multiple maps.

5/23

Kayla: I tried to fix the rotations as they were not working as I had imagined. Now the world should spin based on the kart's position.

5/24

Kayla: I completely changed my approach to movement.  The keyPressed function is now in the right place.  I removed the left(a), right(d), and turning keys(r and t) and replaced the a and d keys with turnRight and turnLeft instead.  The move back and up commands are now based on rotation angle.

5/25

Kayla: Today, I started to code the different screens.  I was able to make the start screen and began the kart selection screen as well.  I experimented with mouseClicked, text, stroke, font, etc.  The background for the kart selection screen is a gradient. The player can now enter in their desired username (userinput/can delete as well) and pick the color for their kart (hover over the color you want and the spinning kart to your right would get updated)

Hilary: I began adding points for scoring, so that a kart would earn points for driving on the road and lose points for going off of it. I created a simple game in the Experiment folder for testing isOnRoad to figure out a better algorithm. I created the function but need to figure out how to implement it in the game.

5/26

Kayla: isOnRoad is now working for the our game (the zoomed in, translated version of the map).  It is a bit off due to the rounding in get() which only accepts ints as its parameters.

Hilary: I worked on keeping track of time. I added to the Image class so that it could store the race's start time and display a timer showing how long the race had gone on. I also started developing a way for the kart to finish its race.

5/27

Kayla: If the kart is off the road (touching the green/blue/etc), the speed of the kart would go down.  Once you are back on track, the speed returns to normal.  I also started the Computer class (not much code/mainly thinking).

Hilary: I added to the Kart class so that it could only move while in a race, and wrote a move function so that the kart moved forward automatically. The player only needs to turn left or right.

5/28

Kayla: I managed to fix the color detection (It was an extremely small error).  The kart is rotating about its center for the game now as well.  I started the Obstacle class and the mapSelect screen (only one map right now).  I wrote isOnWater and thus if the kart lands on the blue pixels, the kart would drown and transfer to the lostScreen().  Once you reach the lost screen, you can replay.  It would transfer you back to the mapSelect screen.  The game would be reset.

Hilary: I continued working on what happens when the kart finishes the race, and started adding a new screen at the end. I also added the Tree class, which inherits from the Obstacle class, and wrote some basic methods for it.

5/29

Kayla: I changed the speed for the kart to make it less tedious to play and to make testing easier.  We also discussed together how to end the game.

Hilary: I fixed the game so that when the kart reaches the finish line a ending screen and leaderboard is displayed, with the kart's place, name, time, and score.

5/30

Kayla: I started to get working on the obstacles.  In order to make displaying objects in the right places easier, I created a roadPixels() method that as its name suggests, saves the x and y coordinates for all the pixels on the road.  To start the obstacles, I chose to start with rocks.  I wrote rockCoor, displayObstacles and moveBackObs in order to get the rocks to display correctly in the right location regardless of the translations and rotations.

Hilary: I started working on implementing the Player class and expanding the Computer class by writing a draw method for it.

5/31

Kayla: I added the Collideable interface and wrote the isTouching method.  If your kart touches a rock, the speed should be set to zero.  You can gain back your speed by clicking the "s" key.

Hilary: I started working on random direction for the computer. To choose its path, the computer will test many different angles to find which directions keep them on the road. Out of those angle, the computer will then pick a random spot and move to it. I decided to add a left bound and a right bound, which limit the computer to only testing angles in front of it.

6/1

Kayla: I wrote the reset method so that when players die, the rocks would still be displaying in the right areas.  I also fixed the glitchy kart collisions so that the player would be stopped once he/she gets into a certain radius around the rock.  I wrote isOnBottom and started to play around with transparency for the overlapping intersection.

Hilary: I continued trying to improve the randomDirection method by adding the mapX and mapY variables to Computer, which would track the kart's position on a normal map, without the translations. I aimed to use that to figure out the direction of the kart before translating it onto the screen, and used the Experiment folder to test it, but the method is still buggy. I also added methods to randomly pick a color for the computer, that is different from the Player.

6/2

Hilary: I wrote a second version of randomDirection, where the computer tries to go as straight as possible. The method works in Experiment, without the transformations, and I'm still working on getting the method to work and the kart to display correctly in the actual game.
