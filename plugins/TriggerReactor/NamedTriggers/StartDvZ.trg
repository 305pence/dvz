IMPORT java.util.UUID
{"UUID.game"} = UUID.randomUUID().toString()
{"t"} = -1
#SCOREBOARD "TEAM" "dwarves" "TEAMDAMAGE" false
#SCOREBOARD "TEAM" "monsters" "TEAMDAMAGE" false
#SCOREBOARD "TEAM" "lobby" "TEAMDAMAGE" false
#TIME $worldname 0
#CMDCON "trg repeat timer toggle"
FOR player = getPlayers()
 {"UUID.player." + $playeruuid} = {"UUID.game"}
 #SCOREBOARD "OBJ" "dragonDamage:dummy" "SET" $playername 0
 #SCOREBOARD "OBJ" "DvZ:dummy" "SLOT" "SIDEBAR"
 #SCOREBOARD "OBJ" "DvZ:dummy" "SET" "Gold" 50
ENDFOR
#CALL "DiscHandouts"