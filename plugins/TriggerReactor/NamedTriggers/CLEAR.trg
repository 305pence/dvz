//clears the player's inventory (usage: #CLEAR {player}) (object)
player = args[0]
FOR ic = 0:41
 #SETPLAYERINV ic, item("AIR", 1)
 #CLEARPOTION
ENDFOR