
IF block.getType().name() == "GRAVEL"
 IF $haspermission:"dwarf"
  event.setDropItems(false)
  #DROPITEM item("COBBLESTONE", $random:4:7), location($worldname, (block.getX() + 0.5), (block.getY() + 0.5), (block.getZ() + 0.5))
 ENDIF
ENDIF