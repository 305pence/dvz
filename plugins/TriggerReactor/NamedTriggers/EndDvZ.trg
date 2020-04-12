IMPORT org.bukkit.NamespacedKey
IMPORT org.bukkit.Bukkit
{"UUID.game"} = "off"
{"MobRelease"} = false
{"shrineHealth"} = 0
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
ENDFOR
ASYNC
 FOR player = getPlayers()
  #CMDCON "lp user $playername parent set default"
 ENDFOR
ENDASYNC
bar = Bukkit.getBossBar(NamespacedKey.minecraft("pingas"))
bar.removeAll()
Bukkit.removeBossBar(NamespacedKey.minecraft("pingas"))