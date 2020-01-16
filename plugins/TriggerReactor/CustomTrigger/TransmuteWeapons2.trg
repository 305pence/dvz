IMPORT org.bukkit.event.block.Action
IMPORT org.bukkit.event.player.PlayerInteractEvent

IF event.getAction() != Action.LEFT_CLICK_BLOCK
 #STOP
ENDIF
IF event.getClickedBlock().getBlockData().getMaterial().name() == "GOLD_BLOCK" && $haspermission:"blacksmith"
 gold = event.getClickedBlock().getLocation()
 #SETBLOCK "AIR", gold
 #SOUND player.getLocation(), "BLOCK_ANVIL_DESTROY", 0.5, 0.5
 #DROPITEM item("REDSTONE_ORE", 4), gold
 #DROPITEM item("COAL", 15), gold
 #DROPITEM item("DIAMOND_SWORD", 1), gold
 #DROPITEM item("FLINT", 32), gold
 #DROPITEM item("FEATHER", 32), gold
 #DROPITEM item("STRING", 3), gold
 #DROPITEM item("IRON_SHOVEL", 1), gold
 #DROPITEM item("IRON_AXE", 1), gold
 IF $random:1:3 == 2
  #DROPITEM item("SHEARS", 1), gold
 ENDIF
 IF $random:1:3 == 2
  #DROPITEM item("DIAMOND_PICKAXE", 1), gold
 ENDIF
 IF $random:1:4 == 3
  #DROPITEM item("GLOWSTONE_DUST", $random:1:3), gold
 ENDIF
 IF $random:1:6 == 5
  #DROPITEM item("FLINT_AND_STEEL", 1), gold
 ENDIF
 IF $random:1:6 <= 2
  #DROPITEM item("SHIELD", 1), gold
 ENDIF
 IF $random:1:26 <= 2
  #CMDCON "kit LW $playername"
 ENDIF
ENDIF