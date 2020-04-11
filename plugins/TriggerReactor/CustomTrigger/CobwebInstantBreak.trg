IF event.getAction().name() == "LEFT_CLICK_BLOCK"
 IMPORT org.bukkit.Material
 block = event.getClickedBlock()
 IF block.getType().name() == "COBWEB" && ($helditemname == "DIAMOND_SWORD" || $helditemname == "GOLDEN_SWORD" || $helditemname == "STONE_SWORD") && $haspermission:"dwarf" && !($haseffect:"SLOW_DIGGING")
  block.setType(Material.AIR)
 ENDIF
ENDIF