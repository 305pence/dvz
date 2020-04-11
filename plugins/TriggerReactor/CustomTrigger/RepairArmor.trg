IMPORT org.bukkit.Material
IF !(event.getAction().name() == "RIGHT_CLICK_BLOCK" || event.getAction().name() == "LEFT_CLICK_BLOCK") || event.getItem() == null
 #STOP
ENDIF
item = event.getItem()
pu = item.getType().name()
IF (pu == "DIAMOND_HELMET" || pu == "DIAMOND_CHESTPLATE" || pu == "DIAMOND_LEGGINGS" || pu == "DIAMOND_BOOTS") && event.getClickedBlock().getType().name() == "ENCHANTING_TABLE"
 #CANCELEVENT
 IF $getscore:"DvZ":"Gold" >= 2
  meta = item.getItemMeta()
  IF meta.hasDamage()
   #SCOREBOARD "OBJ" "DvZ:dummy" "SET" "Gold" $getscore:"DvZ":"Gold" - 2
   IF meta.getDamage() > 150
    meta.setDamage(meta.getDamage() - 150)
   ELSE
    meta.setDamage(0)
   ENDIF
   item.setItemMeta(meta)
   #SETHELDITEM item
   #SOUNDALL player.getLocation(), "BLOCK_ANVIL_USE", 1, 0.7
   #COOLDOWN 0.4
  ELSE
   #MESSAGE "&3Already repaired."
  ENDIF
 ELSE
  #MESSAGE "&3Not enough gold."
 ENDIF
ENDIF