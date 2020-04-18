name = event.getEntity().getCustomName()
IF name == "potion"
 IMPORT org.bukkit.entity.EntityType
 IMPORT org.bukkit.Color
 name = event.getEntity().getUniqueId()
 nearby = entity.getNearbyEntities(2.5, 2.5, 2.5)
 FOR player = nearby
  IF $haspermission:"dwarf" && !($haspermission:"assassin")
   #CLEARPOTION {?name + ".effect"}
   #POTION {?name + ".effect"}, {?name + ".time"}, {?name + ".potency"}
  ENDIF
 ENDFOR
 world = event.getEntity().getWorld()
 splash = world.spawnEntity(event.getEntity().getLocation(), EntityType.SPLASH_POTION)
 item = splash.getItem()
 meta = item.getItemMeta()
 IF {?name + ".effect"} == "FIRE_RESISTANCE"
  meta.setColor(Color.ORANGE)
 ELSEIF {?name + ".effect"} == "INCREASE_DAMAGE"
  meta.setColor(Color.MAROON)
 ELSEIF {?name + ".effect"} == "SPEED"
  meta.setColor(Color.AQUA)
 ELSEIF {?name + ".effect"} == "HEAL"
  meta.setColor(Color.RED)
 ENDIF
 item.setItemMeta(meta)
 splash.setItem(item)
 splash.setVelocity(entity.getVelocity())
ENDIF
