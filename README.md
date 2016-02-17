# MiniRPG
This is just a small RPG :)

It's pretty basic I've only spent some hours to create it.
The game engine includes two different characters, random damage within a range, critical hits, parrying, blocking with a health related blocking value.
After an attack the next attack is disabled for one second.
An additional idea would be to hurt yourself if you tap earlier to make it a reaction game instead of a tapping game.

Basically it supports custom player names and choosing characters. Only an input screen needs to be implemented.


###Requirements:
- App should be landscape only
- App should have two characters. Each character has:
	- HP
	- Attack Power
	- Name
- This is a two player game so each character should have an attack button. When one player attacks, the other player/button is disabled for 3 seconds before they can attack
- If a player dies, the screen should print who won
- When the game ends, give an option to restart the game
- Use Classes to build your game

####Additionals
- Add sound fx for the attacks and death
- Add some background music
- When the game first starts allow each player to choose which character they want to be, the orc or the solider (ie you could have two soliders fighting each other or two orcs, etc)
- Create a Game class that manages the game state (instead of using the view controller)
