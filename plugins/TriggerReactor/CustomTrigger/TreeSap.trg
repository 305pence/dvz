IMPORT org.bukkit.event.block.BlockPlaceEvent

IF $haspermission:"lumberjack"
 replaced = event.getBlockReplacedState().getBlockData().getMaterial().name()
 IF replaced == "OAK_LOG" || replaced == "SPRUCE_LOG" || replaced == "BIRCH_LOG" || replaced == "JUNGLE_LOG" || replaced == "ACACIA_LOG" || replaced == "DARK_OAK_LOG"
  pu = event.getBlockPlaced().getBlockData().getMaterial().name()
  IF pu == "STRIPPED_OAK_LOG" || pu == "STRIPPED_SPRUCE_LOG" || pu == "STRIPPED_BIRCH_LOG" || pu == "STRIPPED_JUNGLE_LOG" || pu == "STRIPPED_ACACIA_LOG" || pu == "STRIPPED_DARK_OAK_LOG"
   IF $random:1:3 == 2
    item = item("BROWN_DYE", 1)
    meta = item.getItemMeta()
    meta.setDisplayName("Tree Sap")
    item.setItemMeta(meta)
    #DROPITEM item, player.getLocation()
   ENDIF
  ENDIF
 ENDIF
ENDIF