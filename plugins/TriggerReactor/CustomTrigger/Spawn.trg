IMPORT java.lang.String
i = $helditemname
IF i.contains("_SPAWN_EGG")
 IF !({"MobRelease"})
  #MESSAGE "&cMobs are not released yet"
  #STOP
 ENDIF
 IF $isop
  #STOP
 ENDIF
 i = i.replaceAll("_SPAWN_EGG", "")
 IF {"lives." + i} != null
  IF {"lives." + i} > 0
   IF !(i == "ZOMBIE" || i == "SKELETON" || i == "CREEPER" || i == "SPIDER")
    {"lives." + i} = {"lives." + i} - 1
   ENDIF
   #CLEAR player
   IF i.contains("SPIDER")
    #POTION "JUMP", 200000, 3
    #POTION "SPEED", 200000, 2
   ENDIF
   #CMDCON "lp user $playername parent set " + i.toLowerCase()
   #POTION "NIGHT_VISION", 200000, 1
   #POTION "DAMAGE_RESISTANCE", 200000, 2
   #POTION "HEAL", 20, 100
   #SETGAMEMODE 0
   #SCOREBOARD "TEAM" "monsters" "ADD" $playername
   IF {"location.portal"}
    #TP {"location.portal"}
   ELSE
    #TP {"location.mobspawn"}
   ENDIF
   #KIT player, i
  ELSE
   #MESSAGE i.toLowerCase() + " &3has already been taken"
  ENDIF
 ELSE
  #MESSAGE "&cthis mob does not seem to exist. either you got this spawn egg through means of creative or /give, or i just forgot to add a lives value to this mob"
 ENDIF
ENDIF