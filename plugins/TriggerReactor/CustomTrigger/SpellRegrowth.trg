IMPORT org.bukkit.entity.HumanEntity
IMPORT org.bukkit.Particle
IMPORT org.bukkit.util.Vector
IMPORT org.bukkit.inventory.meta.Damageable
IF ($haspermission:"dwarf" && !($haspermission:"hero")) || $isop
 IF event.getHand().name() == "HAND"
  item = $helditem
 ELSEIF event.getHand().name() == "OFF_HAND"
  item = $offhanditem
 ENDIF

 IF item == null
  #STOP
 ENDIF
 
 IF item.getType().name() == "NETHER_STAR" && hasLore(item, "Click to regrow")
  entity = event.getRightClicked()
  IF $getteam:player == $getteam:entity
   IF $explevel >= 10
    player.setLevel($explevel - 10)
    loc = player.getLocation()
    loc.add(0, 0.75, 0)
    locT = entity.getLocation()
    locT.add(0, 0.75, 0)
    #LASER loc, locT, "HEART", 0
    player = entity
    #POTION "HEAL", 1, 1
    IF player IS HumanEntity
     inv = player.getInventory()
     FOR i = 36:40
      item = inv.getItem(i)
      IF item IS Damageable
       IF meta.getDamage() > 35
        meta.setDamage(meta.getDamage() - 35)
       ELSE
        meta.setDamage(0)
       ENDIF
      ENDIF
     ENDFOR
    ENDIF
    #SOUNDALL player.getLocation(), "ENTITY_PLAYER_LEVELUP", 1, 2
    world = $world
    world.spawnParticle(Particle.HEART, locT, 15, 0.25, 0.5, 0.25)
    #COOLDOWN 0.7
   ELSE
    #MESSAGE "&3Not enough mana."
   ENDIF
  ENDIF
 ENDIF
ENDIF