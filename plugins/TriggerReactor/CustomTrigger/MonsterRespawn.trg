IMPORT org.bukkit.entity.EntityType
event.setRespawnLocation({"location.lobby"})
#SETGAMEMODE 2
IF $haspermission:"dead"
 #GIVE item("ZOMBIE_SPAWN_EGG", 1)
 IF $random:1:3 == 2
  #GIVE item("SKELETON_SPAWN_EGG", 1)
 ENDIF
 IF $random:1:4 == 3
  #GIVE item("CREEPER_SPAWN_EGG", 1)
 ENDIF
 IF $random:1:9 == 8
  #GIVE item("SPIDER_SPAWN_EGG", 1)
 ENDIF
 v = EntityType.values()
 FOR array = v
  IF array.isAlive()
   mob = array.toString()
   IF {"lives." + mob} == null || (mob == "ZOMBIE" || mob == "SKELETON" || mob == "SPIDER" || mob == "CREEPER")
    #CONTINUE
   ENDIF
   IF {"lives." + mob} > 0
    IF mob == "IRON_GOLEM"
		#GIVE item("IRON_PICKAXE", 1)
	ELSE
		#GIVE item(mob + "_SPAWN_EGG", 1)
	ENDIF
   ENDIF
  ENDIF
 ENDFOR
ENDIF