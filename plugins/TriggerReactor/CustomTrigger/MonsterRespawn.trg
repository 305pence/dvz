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
 IF {"lives.zombievillager"} >= 1
  #GIVE item("ZOMBIE_VILLAGER_SPAWN_EGG", 1)
 ENDIF
 IF {"lives.wolf"} >= 1
  #GIVE item("WOLF_SPAWN_EGG", 1)
 ENDIF
ENDIF