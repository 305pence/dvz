IF event.getItem() != null
 IF $idname:event.getItem() == "GHAST_TEAR"
  locP = player.getLocation()
  locP.add(0, 1, 0)
  locB = getTargetBlock(player, 30).getLocation()
  locB.add(0.5, 0.5, 0.5)
 ELSE
  #STOP
 ENDIF
 IF event.getAction().name() == "RIGHT_CLICK_AIR" || event.getAction().name() == "RIGHT_CLICK_BLOCK"
  #LASER locP, locB, "CRIT_MAGIC", 0
 ELSE
  #LASER locP, locB, "FLAME", 0.15
 ENDIF
ENDIF