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

Hilary: I working on keeping track of time. I added to the Image class so that it could store the race's start time and display a timer showing how long the race had gone on. I also started developing a way for the kart to finish its race.

5/27

Kayla: If the kart is off the road (touching the green/blue/etc), the speed of the kart would go down.  Once you are back on track, the speed returns to normal.  I also started the Computer class (not much code/mainly thinking).

Hilary: I added to the Kart class so that it could only move while in a race, and wrote a move function so that the kart moved forward automatically. The player only needs to turn left or right.

5/28

Kayla:
fixed colordetection
rotating around center of kart
start obstacle class
started mapselect screen
wrote isonWater - if on water - drown
lostScreen which connects back to the mapselect