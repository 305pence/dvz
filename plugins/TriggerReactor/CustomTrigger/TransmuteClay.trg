IMPORT org.bukkit.event.block.Action

IF event.getAction() != Action.LEFT_CLICK_AIR && event.getAction() != Action.LEFT_CLICK_BLOCK
 #STOP
ENDIF
IF $idname:$helditem == "BOOK" && $lore:($helditem) == "Transmute Clay" && $haspermission:"transmuteClay"
 IF takeItem(player, "WHEAT", 3)
  IF takeItem(player, "WATER_BUCKET", 1)
   #COOLDOWN 0.1
   #GIVE item("BUCKET", 1)
   #DROPITEM item("CLAY", 5), player.getLocation()
  ELSE
   #MESSAGE "&63 Wheat &3and &6A Bucket Of Water &3are required to transmute."
   #DROPITEM item("WHEAT", 3), player.getLocation()
  ENDIF
 ELSE
  #MESSAGE "&63 Wheat &3and &6A Bucket Of Water &3are required to transmute."
 ENDIF
ENDIF
