IMPORT org.bukkit.event.block.Action
IMPORT org.bukkit.event.player.PlayerInteractEvent

IF event.getAction() != Action.LEFT_CLICK_BLOCK
 #STOP
ENDIF
IF event.getClickedBlock().getBlockData().getMaterial().name() == "GOLD_BLOCK" && $haspermission:"blacksmith"
 gold = event.getClickedBlock().getLocation()
 gold.add(0.5, 0.5, 0.5)
 #SETBLOCK "AIR", gold
 #SCOREBOARD "OBJ" "transmute:dummy" "SET" $playername 1 + $getscore:"transmute":$playername
 #SOUND player.getLocation(), "BLOCK_ANVIL_DESTROY", 0.5, 0.5
 #DROPITEM item("REDSTONE_ORE", 4), gold
 #DROPITEM item("COAL", 15), gold
 sword = item("DIAMOND_SWORD", 1)
 #SETITEMLORE " \n&7When in main hand:\n &22 Attack Speed\n &28 Attack Damage", sword
 #SETATTRS sword, "GENERIC_ATTACK_SPEED", -2, "HAND", "GENERIC_ATTACK_DAMAGE", 7, "HAND"
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
 IF $random:1:21 == 1
  #CMDCON "kit LW $playername"
 ENDIF
 IF $getscore:"DvZ":"Gold" != null
	#SCOREBOARD "OBJ" "DvZ:dummy" "SET" "Gold" $getscore:"DvZ":"Gold" + $random:4:9
 ENDIF
 bCount = 0
 jCount = 0
 FOR player = getPlayers()
	IF $haspermission:"jeweller"
		bCount = bCount + 1
		jCount = jCount + 1
	ELSEIF $haspermission:"blacksmith"
		bCount = bCount + 1
	ENDIF
 ENDFOR
 IF $getscore:"transmute":$playername > 8 && bCount/3.0 >= jCount
	IF $random:0:(1 + toInt(bCount/2 + jCount)) == 0
		#CMDCON "lp user $playername parent add jeweller"
		book = item("WRITTEN_BOOK", 1)
		bMeta = book.getItemMeta()
		bMeta.addPage("the Jeweller job is an upgrade from blacksmith. You are still able to do blacksmith things like making weapons, but you can now make gems and other special items as well")
		bMeta.addPage("You hammer out coal and emeralds into useful gems. Simply place them on the table as you would with a clock, and cut them with your pickaxe")
		bMeta.setTitle("Jeweller Handbook")
		bMeta.setAuthor("друг")
		book.setItemMeta(bMeta)
		#GIVE book
	ENDIF
 ENDIF
ENDIF