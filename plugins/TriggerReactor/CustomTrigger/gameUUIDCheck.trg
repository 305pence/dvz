IMPORT org.bukkit.NamespacedKey
IMPORT org.bukkit.Bukkit
IF {"UUID.game"} != {"UUID.player." + $playeruuid}
 ASYNC
  #WAIT 2
  #TP {"location.lobby"}
 ENDASYNC
ENDIF
IF {"UUID.game"} != {"UUID.player." + $playeruuid}
 IF {"UUID.game"} != "off"
  bar = Bukkit.getBossBar(NamespacedKey.minecraft("pingas"))
  bar.addPlayer(player)
 ENDIF
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
  #SCOREBOARD "OBJ" "witherDamage:dummy" "SET" $playername 0
  #CALL "DiscHandout"
 ENDIF
ENDIF