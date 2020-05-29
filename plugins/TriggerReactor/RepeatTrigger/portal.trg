IF trigger == "init"
 c = 0
 IMPORT org.bukkit.Material
ENDIF

IF trigger == "repeat" && {"MobRelease"}
 IMPORT org.bukkit.Material
 portal = {"portal.location"}
 IF {"portal.state"}
  player = {"portal.enderman"}
  IF player == null
   exp = 0
  ELSE
   exp = $explevel
  ENDIF
  IF exp == 0
   SYNC
   #BROADCAST "&5@=============================@"
   #BROADCAST "&5The portal has run out of power!"
   #BROADCAST "&5@=============================@"
   {"portal.state"} = false
   portal = {"portal.location"} 
   world = portal.getWorld()
   pz = portal.getBlockZ()
   px = portal.getBlockX()
   py = portal.getBlockY() - 1
   FOR x = -5:6
    FOR z = -5:6
	 block = world.getBlockAt(px + x, py , pz + z)
	 IF block.getType().name() == "END_GATEWAY"
	  block.setType(Material.AIR)
	 ENDIF
	ENDFOR
   ENDFOR
   ENDSYNC
  ENDIF 
  c = 2
  #DROPITEM item("END_STONE", 1), portal
  player = {"portal.enderman"}
  IF player != null
   #GIVE item("ZOMBIE_SPAWN_EGG", 1)
   r = $random:1:11
   IF r <= 3
    spawn = "SKELETON_SPAWN_EGG"
   ELSEIF r <= 4
    spawn = "ENDERMAN_SPAWN_EGG"
   ENDIF
   IF spawn != null
    #GIVE item(spawn, 1)
   ENDIF
  ENDIF
 ELSEIF c == 0
  world = portal.getWorld()
  pz = portal.getBlockZ()
  px = portal.getBlockX()
  py = portal.getBlockY() - 1
   FOR x = -5:6
    FOR z = -5:6
 	 block = world.getBlockAt(px + x, py , pz + z)
	 IF block.getType().name() == "END_STONE" || block.getType().name() == "GOLD_BLOCK"
	  IF $random:1:6 == 5
	   SYNC
        block.setType(Material.AIR)
	   ENDSYNC
	  ENDIF
	 ENDIF
    ENDFOR
   ENDFOR
 ELSE
  c = c - 1
 ENDIF
ENDIF 