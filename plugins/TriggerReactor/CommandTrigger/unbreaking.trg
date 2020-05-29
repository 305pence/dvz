IMPORT org.bukkit.inventory.ItemFlag
item = $helditem
IF item.getType().name() != "AIR"
 meta = item.getItemMeta()
 meta.setUnbreakable(true)
 item.setItemMeta(meta)
ENDIF