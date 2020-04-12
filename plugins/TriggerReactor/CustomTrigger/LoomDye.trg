IMPORT org.bukkit.event.player.PlayerInteractEvent

IF event.getClickedBlock() == null
 #STOP
ENDIF

IF event.getClickedBlock().getBlockData().getMaterial().name() == "LOOM"
 id = $idname:$helditem
 IF id == "LIGHT_BLUE_DYE" || id == "MAGENTA_DYE" || id == "LIGHT_GRAY_DYE" || id == "PINK_DYE" || id == "BLUE_DYE"
  takeItem(player, id, 1)
  IF $random:1:3 == 1
   dye = item("RED_DYE", 1)
  ELSE
   dye = item("YELLOW_DYE", 1)
  ENDIF
  #DROPITEM dye, player.getLocation()
 ENDIF
ENDIF