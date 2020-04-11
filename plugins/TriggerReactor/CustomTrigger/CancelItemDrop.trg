IF !($haspermission:"dwarf")
 #MESSAGE "&cYou cannot drop items"
 #CANCELEVENT
ENDIF
item = event.getItemDrop().getItemStack()
IF item.getItemMeta().hasLore()
 lore = item.getItemMeta().getLore()
 FOR l = lore
  IF l == "§6Hero Item"
   #MESSAGE "&cYou probably shouldn't drop that"
   #CANCELEVENT
   #STOP
  ENDIF
 ENDFOR
ENDIF