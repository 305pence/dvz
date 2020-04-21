IF event.getSlotType().name() == "RESULT" && event.getClickedInventory().getType().name() == "ANVIL"
 IF event.getCurrentItem().getItemMeta() == null
  #STOP
 ENDIF
 name = event.getCurrentItem().getType().name()
 IF name == "DIAMOND_HELMET" || name == "DIAMOND_CHESTPLATE" || name == "DIAMOND_LEGGINGS" || name == "DIAMOND_BOOTS"
  pu = 3
 ELSE
  pu = 7
 ENDIF
 IF event.getCurrentItem().getItemMeta().getRepairCost() >= pu
  #MESSAGE "&3These anvils are not strong enough to support your heavy enchanting"
  #CANCELEVENT
 ENDIF
ENDIF