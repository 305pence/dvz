IMPORT org.bukkit.event.player.PlayerInteractEvent
IMPORT org.bukkit.event.block.Action
IMPORT org.bukkit.Bukkit

IF event.getAction() != Action.RIGHT_CLICK_BLOCK || event.getHand().name() != "HAND"
 #STOP
ENDIF

IF event.getClickedBlock().getBlockData().getMaterial().name() == "PISTON_HEAD"
 tableX = event.getClickedBlock().getX()
 tableY = event.getClickedBlock().getY() + 1
 tableZ = event.getClickedBlock().getZ()
 IF $blockname:"world":tableX:tableY:tableZ == "air"
  IF takeItem(player, "CLOCK", 3)
   #COOLDOWN 1
   #SETBLOCK "YELLOW_CONCRETE_POWDER", tableX, tableY, tableZ
   #SOUND player.getLocation(), "BLOCK_ANVIL_PLACE", 0.5, 0.5
   #STOP
  ELSE
   #MESSAGE "&63 Clocks &3are required to transmute."
   #STOP
  ENDIF
 ELSE
  #MESSAGE "&3There's already something on the table."
  #STOP
 ENDIF
ENDIF

IF event.getClickedBlock().getBlockData().getMaterial().name() == "YELLOW_CONCRETE_POWDER"
 IF $helditemname == "IRON_PICKAXE" || $helditemname == "DIAMOND_PICKAXE"
  IF $explevel >= 2
   player.setLevel($explevel - 2)
   #COOLDOWN 1
   IF $random:1:4 == 3
    gold = event.getClickedBlock().getLocation()
    #SETBLOCK "GOLD_BLOCK", gold
    #SOUNDALL player.getLocation(), "BLOCK_ANVIL_LAND", 0.5, 0.5
   ELSE
    #SOUNDALL player.getLocation(), "BLOCK_ANVIL_LAND", 0.5, 0.5
   ENDIF
  ELSE
   #MESSAGE "&3Not enough mana."
  ENDIF
 ENDIF
ENDIF