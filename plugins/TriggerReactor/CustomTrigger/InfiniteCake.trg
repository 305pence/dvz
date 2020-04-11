IF event.getAction().name() != "RIGHT_CLICK_BLOCK"
 #STOP
ENDIF
block = event.getClickedBlock()
IF block != null
 IF block.getType().name() == "CAKE"
  IF $haspermission:"dwarf"
   #SETBLOCK "CAKE", block.getLocation().getX(), block.getLocation().getY(), block.getLocation().getZ()
  ENDIF
 ENDIF
ENDIF