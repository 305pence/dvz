IMPORT org.bukkit.NamespacedKey
IMPORT org.bukkit.Bukkit
IMPORT org.bukkit.entity.EntityType
ASYNC
 FOR player = getPlayers()
  #UNDISGUISE
  #CMDCON "lp user $playername parent set default"
 ENDFOR
ENDASYNC
v = EntityType.values()
FOR array = v
 IF array.isAlive()
  mob = array.toString()
  IF {"lives." + mob} == null || mob == "ZOMBIE" || mob == "SKELETON" || mob == "SPIDER" || mob == "CREEPER"
   #CONTINUE
  ENDIF
  {"lives." + mob} = 0
 ENDIF
ENDFOR
{"UUID.game"} = "off"
{"MobRelease"} = false
{"shrineHealth"} = 0
{"portal.enderman"} = null
{"portal.state"} = false
#CMDCON "trg repeat timer toggle"
FOR player = getPlayers()
 #SETGAMEMODE 2
 #CLOSEGUI
 #CLEARPOTION
 #TP {"location.lobby"}
 FOR i = 0:41
  #SETPLAYERINV i, item("AIR", 1)
 ENDFOR
 #SCOREBOARD "TEAM" "lobby" "ADD" $playername
 #SCOREBOARD "OBJ" "empty:dummy" "SLOT" "SIDEBAR"
 #SCOREBOARD "OBJ" "DvZ:dummy" "SET" "Doom Clock" null
 bar = Bukkit.getBossBar(NamespacedKey.minecraft("pingas"))
 IF bar != null
  bar.removeAll()
  Bukkit.removeBossBar(NamespacedKey.minecraft("pingas"))
 ENDIF
ENDFOR