IMPORT java.util.UUID
IMPORT org.bukkit.NamespacedKey
IMPORT org.bukkit.Bukkit
IMPORT org.bukkit.boss.BarColor
IMPORT org.bukkit.boss.BarStyle
{"UUID.game"} = UUID.randomUUID().toString()
{"t"} = -1
#BROADCAST "1 starting game"
#SCOREBOARD "TEAM" "dwarves" "TEAMDAMAGE" false
#SCOREBOARD "TEAM" "monsters" "TEAMDAMAGE" false
#SCOREBOARD "TEAM" "lobby" "TEAMDAMAGE" false
#SCOREBOARD "OBJ" "DvZ:dummy" "SET" "Gold" 50
locS = {"location.shrine"}
#TIME locS.getWorld().getName() 0
#CMDCON "trg repeat timer toggle"
FOR player = getPlayers()
 {"UUID.player." + $playeruuid} = {"UUID.game"}
 #SCOREBOARD "OBJ" "dragonDamage:dummy" "SET" $playername 0
 #SCOREBOARD "OBJ" "witherDamage:dummy" "SET" $playername 0
 #SCOREBOARD "OBJ" "DvZ:dummy" "SLOT" "SIDEBAR"
 #SCOREBOARD "OBJ" "transmute:dummy" "SET" $playername 0
ENDFOR
c = 0
FOR x = 0:2
 FOR z = 0:2
  c = c + 1
  loc = locS.clone()
  loc.add(x, 0, z)
  #SETBLOCK "ENCHANTING_TABLE", loc
  {"location.shrine" + c} = loc
  {"shrine" + c} = 30
 ENDFOR
ENDFOR
IF Bukkit.getBossBar(NamespacedKey.minecraft("pingas")) == null
	key = NamespacedKey.minecraft("pingas")
	bar = Bukkit.createBossBar(key, "§3Shrine Power", BarColor.BLUE, BarStyle.SEGMENTED_12)
	bar.setProgress(1)
	FOR p = getPlayers()
		bar.addPlayer(p)
	ENDFOR
ENDIF

#CALL "DiscHandouts"