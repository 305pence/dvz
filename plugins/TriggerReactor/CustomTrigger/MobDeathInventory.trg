IMPORT org.bukkit.Material
FOR item = event.getDrops()
 IF hasLore(item, "§6Hero Item")
  item.setType(Material.AIR)
 ENDIF
ENDFOR

 event.getDrops().clear()

event.setDroppedExp(0)