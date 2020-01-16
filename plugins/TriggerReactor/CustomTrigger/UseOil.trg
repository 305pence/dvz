IMPORT org.bukkit.event.player.PlayerInteractEvent
IMPORT org.bukkit.event.block.Action
IMPORT org.bukkit.Bukkit

IF event.getAction() != Action.RIGHT_CLICK_BLOCK || event.getHand().name() != "HAND"
 #STOP
ENDIF

IF event.getClickedBlock().getBlockData().getMaterial().name() == "BLUE_TERRACOTTA"
 pu = player.getLocation()
 IF $helditemname == "STICK"
  takeItem(player, "STICK", 1)
  #COOLDOWN 0.1
  #DROPITEM item("TORCH", 4), player.getLocation()
  #SOUND pu, "ENTITY_SLIME_SQUISH", 1, 0.5
  IF $random:1:101 == 100
   #SETBLOCK "AIR", event.getClickedBlock().getLocation()
   #SOUND pu, "ENTITY_SLIME_SQUISH", 1, 0.5
  ENDIF
 ELSEIF $helditemname == "BOWL"
  #COOLDOWN 0.1
  takeItem(player, "BOWL", 1)
  #SOUND pu, "ENTITY_SLIME_SQUISH", 1, 0.5
  item = item("GRAY_DYE", 4)
  #SETITEMNAME "Mortar", item
  #DROPITEM item, player.getLocation()
  IF $random:1:101 == 100
   pu = player.getLocation()
   #SETBLOCK "AIR", event.getClickedBlock().getLocation()
   #SOUND pu, "ENTITY_SLIME_SQUISH", 1, 0.5
  ENDIF
 ENDIF
ENDIF