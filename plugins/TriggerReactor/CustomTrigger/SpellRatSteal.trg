IMPORT org.bukkit.Material
IF !(event.getAction().name() == "RIGHT_CLICK_BLOCK" || event.getAction().name() == "LEFT_CLICK_BLOCK") || event.getItem() == null
 #STOP
ENDIF
item = event.getItem()
IF (item.getType().name() == "IRON_NUGGET" || item.getType().name() == "GHAST_TEAR") && event.getClickedBlock().getType().name() == "ENCHANTING_TABLE" && $lore:($helditem) == "R: To steal gold"
 IF $getscore:"DvZ":"Gold" >= 1 
  #SCOREBOARD "OBJ" "DvZ:dummy" "SET" "Gold" $getscore:"DvZ":"Gold" - 1
  #COOLDOWN 0.8
  #SOUNDALL player.getLocation(), "ENTITY_SILVERFISH_AMBIENT", 10, 1.4
 ELSE
  #MESSAGE "&3No more gold to steal!"
 ENDIF
ENDIF