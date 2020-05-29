IMPORT org.bukkit.entity.Monster
IF entity IS Monster
 IMPORT org.bukkit.Particle
 IF entity.getLastDamageCause() == null
  #STOP
 ENDIF
 cause = entity.getLastDamageCause().getCause()
 IF cause.name() == "ENTITY_ATTACK" || cause.name() == "ENTITY_SWEEP_ATTACK"
  player = entity.getKiller()
  IF player == null
	#STOP
  ENDIF
  IF $haspermission:"dwarf" && ($helditemname == "DIAMOND_SWORD" || $helditemname == "IRON_SHOVEL" || $helditemname == "GOLDEN_SWORD" || $helditemname == "TRIDENT") && $idname:$offhanditem != "DIAMOND_HOE"
    #CLEARPOTION "LUCK"
    #SOUND player.getLocation(), "ENTITY_WITHER_HURT", 0.7, 0.5
    #POTION "LUCK", 45, 1
    world = $world
    world.spawnParticle(Particle.VILLAGER_HAPPY, player.getLocation().getX(), (player.getLocation().getY() + 1), player.getLocation().getZ(), 20, 0.5, 0.5, 0.5)
   ENDIF
 ENDIF
ENDIF