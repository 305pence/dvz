FOR player = getPlayers()
#SCOREBOARD "OBJ" "DvZ" "SET" "Dwarves" 0
#SCOREBOARD "OBJ" "DvZ" "NAME" "DvZ"
#SCOREBOARD "OBJ" "DvZ" "SLOT" "SIDEBAR"
#SCOREBOARD "TEAM" "dwarves" "TEAMDAMAGE" false
#SCOREBOARD "TEAM" "monsters" "TEAMDAMAGE" false
ENDFOR
{"t"} = -1
#TIME $worldname 0
#CMDCON "trg repeat timer toggle"
#CMDCON "trg repeat manaTest toggle"
IF $onlineplayers >= 1
 #CALL "DiscHandout"
ENDIF