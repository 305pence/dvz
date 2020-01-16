IMPORT org.bukkit.event.player.PlayerInteractEvent
IMPORT org.bukkit.event.block.Action

IF event.getAction() != Action.RIGHT_CLICK_BLOCK || event.getHand().name() != "HAND"
 #STOP
ENDIF

IF event.getClickedBlock().getBlockData().getMaterial().name() == "CAULDRON" && $helditemname == "REDSTONE" && event.getClickedBlock().getBlockData().getAsString() != "minecraft:cauldron[level=0]" && $haspermission:"alchemist"
 IF $explevel >= 5
  IF takeItem(player, "REDSTONE", 2)
   #COOLDOWN 0.4
   SYNC
    block
   ENDSYNC
   block = event.getClickedBlock()
   data = block.getBlockData()
   player.setLevel($explevel - 5)
   data.setLevel(data.getLevel() - 1)
   block.setBlockData(data)
   #DROPITEM item("BLAZE_POWDER", 1), player.getLocation()
  ELSE
   #MESSAGE "&62 Redstone &3is required to transmute"
  ENDIF
 ELSE
  #MESSAGE "&3Not enough mana."
 ENDIF
ENDIF