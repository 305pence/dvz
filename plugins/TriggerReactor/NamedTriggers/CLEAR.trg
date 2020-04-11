//clears the player's inventory (usage: #CLEAR {player}) (object)
player = args[0]
FOR i = 0:41
 #SETPLAYERINV i, item("AIR", 1)
 #CLEARPOTION
ENDFOR