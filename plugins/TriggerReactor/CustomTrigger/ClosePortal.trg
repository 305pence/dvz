item = event.getItem()
IF item == null
 #STOP
ENDIF
IF item.getType().name() == "END_STONE" && $haspermission:"dwarf"
 IF {"portal.state"}
  IF $explevel >= 3
//   takeItem(player, "END_STONE", 1)
   player.setLevel($explevel - 3)
   enderman = {"portal.enderman"}
   #COOLDOWN 10
   IF enderman.getLevel() >= 15
    enderman.setLevel(enderman.getLevel() - 15)
	#MESSAGE "&3The portal's power has been weakened"
	#STOP
   ELSE
    enderman.setLevel(0)
   ENDIF
   #BROADCAST "&5@==================================@"
   #BROADCAST "&5The portal has been closed by $playername" + "!"
   #BROADCAST "&5@==================================@"
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
	  #SETBLOCK "AIR" px + x, py, pz + z
	 ELSEIF block.getType().name() == "END_STONE" || block.getType().name() == "GOLD_BLOCK"
	  IF $random:1:6 == 5
       #SETBLOCK "AIR" px + x, py, pz + z
	  ENDIF
	 ENDIF
	ENDFOR
   ENDFOR
  ELSE
   #MESSAGE "&3Not enough mana."
  ENDIF
 ELSE
  #MESSAGE "&3There is no active portal"
 ENDIF
ENDIF
