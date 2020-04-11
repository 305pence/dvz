IMPORT org.bukkit.event.player.PlayerInteractEvent
IMPORT org.bukkit.event.block.Action
IMPORT org.bukkit.potion.PotionType
IMPORT org.bukkit.potion.PotionData

IF event.getAction() != Action.RIGHT_CLICK_BLOCK || event.getHand().name() != "HAND"
 #STOP
ENDIF

IF event.getClickedBlock().getBlockData().getMaterial().name() == "CAULDRON" && $helditemname == "POTION" && event.getClickedBlock().getBlockData().getAsString() != "minecraft:cauldron[level=0]" && $haspermission:"alchemist"
 IF $explevel >= 5
  potion = PotionData(PotionType.INSTANT_HEAL)
  item = item("POTION", 1)
  itemMeta = item.getItemMeta()
  itemMeta.setBasePotionData(potion)
  item.setItemMeta(itemMeta)
  IF $helditem == item
   IF takeItem(player, "REDSTONE", 1)
    #SETHELDITEM item("AIR", 1)
    #DROPITEM item("GLASS_BOTTLE", 1), player.getLocation()
    block = event.getClickedBlock()
    data = block.getBlockData()
    player.setLevel($explevel - 5)
    data.setLevel(data.getLevel() - 1)
    block.setBlockData(data)
    #DROPITEM item("GOLDEN_APPLE", 2), player.getLocation()
   ELSE
    #MESSAGE "&61 Redstone &3is required to make a golden apple"
   ENDIF
  ENDIF
 ELSE
  #MESSAGE "&3Not enough mana."
 ENDIF
ENDIF