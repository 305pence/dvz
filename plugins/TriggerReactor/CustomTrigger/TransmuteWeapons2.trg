IMPORT org.bukkit.event.block.Action
IMPORT org.bukkit.event.player.PlayerInteractEvent

IF event.getAction() != Action.LEFT_CLICK_BLOCK
 #STOP
ENDIF
IF event.getClickedBlock().getBlockData().getMaterial().name() == "GOLD_BLOCK" && $haspermission:"blacksmith"
 gold = event.getClickedBlock().getLocation()
 gold.add(0.5, 0.5, 0.5)
 #SETBLOCK "AIR", gold
 #SOUND player.getLocation(), "BLOCK_ANVIL_DESTROY", 0.5, 0.5
 #DROPITEM item("REDSTONE_ORE", 4), gold
 #DROPITEM item("COAL", 15), gold
 sword = item("DIAMOND_SWORD", 1)
 #SETITEMLORE " \n&7When in main hand:\n &22 Attack Speed\n &27 Attack Damage", sword
 #SETATTRS sword, "GENERIC_ATTACK_SPEED", -2, "HAND", "GENERIC_ATTACK_DAMAGE", 5, "HAND"
 #DROPITEM sword, gold
 #DROPITEM item("FLINT", 32), gold
 #DROPITEM item("FEATHER", 32), gold
 #DROPITEM item("STRING", 3), gold
 #DROPITEM item("IRON_INGOT", $random:4:7 ), gold
 IF $random:1:3 == 2
  #DROPITEM item("DIAMOND_PICKAXE", 1), gold
 ENDIF
 IF $random:1:4 == 3
  #DROPITEM item("GLOWSTONE_DUST", 1), gold
 ENDIF
 IF $random:1:11 == 1
  #CMDCON "kit LW $playername"
 ENDIF
 #SCOREBOARD "OBJ" "DvZ:dummy" "SET" "Gold" $getscore:"DvZ":"Gold" + $random:4:9
ENDIF