IF !(event.getAction().name() == "RIGHT_CLICK_BLOCK" || event.getAction().name() == "LEFT_CLICK_BLOCK") || event.getItem() == null
 #STOP
ENDIF
IMPORT org.bukkit.Material
IF event.getItem().getType().name() == "GOLD_INGOT" && event.getClickedBlock().getType().name() == "ENCHANTING_TABLE"
 #CANCELEVENT
 gold = event.getItem().getAmount()
 #SETHELDITEM item("AIR", 1)
 #SCOREBOARD "OBJ" "DvZ:dummy" "SET" "Gold" $getscore:"DvZ":"Gold" + gold
ENDIF