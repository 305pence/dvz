
c = 0
FOR player = getPlayers()
 IF $haspermission:"dwarf" && !($isop)
  c = c + 1
 ENDIF
ENDFOR
FOR player = getPlayers()
 #SCOREBOARD "OBJ" "DvZ:dummy" "SET" "Dwarves" c
ENDFOR
{"scoreboard.dwarves"} = c

