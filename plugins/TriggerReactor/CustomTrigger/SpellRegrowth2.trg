IMPORT org.bukkit.entity.HumanEntity
IMPORT org.bukkit.Particle
IMPORT org.bukkit.util.Vector
IMPORT org.bukkit.inventory.meta.Damageable
IF $haspermission:"hero"
 IF event.getHand().name() == "HAND"
  item = $helditem
 ELSEIF event.getHand().name() == "OFF_HAND"
  item = $offhanditem
 ENDIF

 IF item == null
  #STOP
 ENDIF
 
 IF item.getType().name() == "NETHER_STAR" && hasLore(item, "§6Hero Item")
  entity = event.getRightClicked()
  IF $getteam:player == $getteam:entity
   IF $explevel >= 20
    player.setLevel($explevel - 20)
    loc = player.getLocation()
    loc.add(0, 0.75, 0)
    locT = entity.getLocation()
    locT.add(0, 0.75, 0)
    #LASER loc, locT, "HEART", 0
    player = entity
    #POTION "ABSORPTION", 100000, 3
    #POTION "REGENERATION", 1200, 1
    #POTION "HEAL", 1, 4
    IF player IS HumanEntity
     inv = player.getInventory()
     FOR i = 36:40
      item = inv.getItem(i)
      IF item IS Damageable
       IF meta.getDamage() > 5
        meta.setDamage(meta.getDamage() - 5)
       ELSE
        meta.setDamage(0)
       ENDIF
      ENDIF
     ENDFOR
    ENDIF
    #SOUNDALL player.getLocation(), "ENTITY_PLAYER_LEVELUP", 0.1, 2
    world = $world
    world.spawnParticle(Particle.HEART, locT, 15, 0.25, 0.5, 0.25)
    #COOLDOWN 0.7
   ELSE
    #MESSAGE "&3Not enough mana."
   ENDIF
  ENDIF
 ENDIF
ENDIF