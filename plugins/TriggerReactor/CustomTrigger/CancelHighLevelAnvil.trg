IF event.getSlotType().name() == "RESULT" && event.getClickedInventory().getType().name() == "ANVIL"
 IF event.getCurrentItem().getItemMeta().getRepairCost() >= 3
  #MESSAGE "&3These anvils are not strong enough to support your heavy enchanting"
  #CANCELEVENT
 ENDIF
ENDIF