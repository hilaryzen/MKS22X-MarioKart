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
