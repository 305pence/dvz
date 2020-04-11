IMPORT org.bukkit.Bukkit
IF args.length < 2 //usage: /dwarf {playername} {class name}
 #MESSAGE "&3You must specifiy the dwarf and the class (blacksmith, baker, lumberjack, tailor, alchemist, witherwarrior, dragonborn)"
 #STOP
ENDIF
player = Bukkit.getPlayer(args[0])
c = args[1]
IF c == "blacksmith" || c == "baker" || c == "alchemist" || c == "lumberjack" || c == "tailor" || c == "witherwarrior" || c == "dragonborn"
  #SETGAMEMODE 0
  #CLEAR player
  #TP {"location.shrine"}
  #CMDCON "luckperms user $playername parent set " + c
  #SCOREBOARD "TEAM" "dwarves" "ADD" $playername
  #SCOREBOARD "OBJ" "dragonDamage:dummy" "SET" $playername 0
  #SCOREBOARD "OBJ" "witherDamage:dummy" "SET" $playername 0
ELSE
  #STOP
ENDIF
IF c == "witherwarrior"
 #WitherWarriorKit player
ELSEIF c == "dragonborn"
 #DragonBornKit player
ELSE
  #CMDCON "kit " + c +" $playername"
ENDIF