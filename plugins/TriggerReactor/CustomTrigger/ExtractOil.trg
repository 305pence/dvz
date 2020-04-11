IMPORT org.bukkit.event.player.PlayerInteractEvent
IMPORT org.bukkit.event.block.Action

IF event.getAction() != Action.LEFT_CLICK_BLOCK
 #STOP
ENDIF

IF $lore:($helditem) == "Extract Oil" && $haspermission:"lumberjack"
 pu = event.getBlockFace().name()
 x = event.getClickedBlock().getX()
 y = event.getClickedBlock().getY()
 z = event.getClickedBlock().getZ()
 IF $explevel >= 10
 item = item("BROWN_DYE", 1)
 meta = item.getItemMeta()
 meta.setDisplayName("Tree Sap")
 item.setItemMeta(meta)
  IF takeItem(player, item, 4)
   IF pu == "UP"
    y = y + 1
   ELSEIF pu == "DOWN"
    y = y - 1
   ELSEIF pu == "NORTH"
    z = z - 1
   ELSEIF pu == "SOUTH"
    z = z + 1
   ELSEIF pu == "EAST"
    x = x + 1
   ELSEIF pu == "WEST"
    x = x - 1
   ENDIF
   IF $blockname:"world":x:y:z == "air"
    player.setLevel($explevel - 10)
    #SETBLOCK "BLUE_TERRACOTTA", x, y, z
   ELSE
    #MESSAGE "&3Not enough space to place the oil"
    #DROPITEM item, player.getLocation()
   ENDIF
  ELSE
   #MESSAGE "&64 Tree Sap &3is required to extract oil (try stripping a tree)"
  ENDIF
 ELSE
  #MESSAGE "&3Not enough mana."
 ENDIF
ENDIF
