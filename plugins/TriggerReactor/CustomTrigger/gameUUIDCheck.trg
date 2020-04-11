IF {"UUID.player." + $playeruuid} == null
 ASYNC
  #WAIT 2
  #TP {"location.lobby"}
 ENDASYNC
ENDIF
IF {"UUID.game"} != {"UUID.player." + $playeruuid}
 #SETGAMEMODE 2
 #CLOSEGUI
 #TP {"location.lobby"}
 #CLEARPOTION
 FOR i = 0:41
  #SETPLAYERINV i, item("AIR", 1)
 ENDFOR
 #CMDCON "lp user $playername parent set default"
 #SCOREBOARD "TEAM" "lobby" "ADD" $playername
 #SCOREBOARD "OBJ" "empty:dummy" "SLOT" "SIDEBAR"
 {"UUID.player." + $playeruuid} = {"UUID.game"}
 IF {"MobRelease"}
  #CMDCON "lp user $playername parent set dead"
  #KILL
 ELSEIF {"UUID.game"} != "off"
  #SCOREBOARD "OBJ" "dragonDamage:dummy" "SET" $playername 0
  #SCOREBOARD "OBJ" "DvZ:dummy" "SLOT" "SIDEBAR"
  #CALL "DiscHandout"
 ENDIF
ENDIF