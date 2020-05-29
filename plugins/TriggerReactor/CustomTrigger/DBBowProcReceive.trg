IMPORT org.bukkit.Particle
IF entity.getLastDamageCause() == null
	#STOP
ENDIF
cause = entity.getLastDamageCause().getCause().name()
IF cause == "PROJECTILE"
 player = entity.getKiller()
 IF player == null
  #STOP
 ENDIF
 IF ($helditemname == "BOW" || $idname:$offhanditem == "BOW") && $haspermission:"dragonborn"
   #CLEARPOTION "LUCK"
   #SOUND player.getLocation(), "ENTITY_WITHER_HURT", 0.7, 0.5
   #POTION "LUCK", 60, 1
   world = $world
   world.spawnParticle(Particle.VILLAGER_HAPPY, player.getLocation().getX(), (player.getLocation().getY() + 1), player.getLocation().getZ(), 20, 0.5, 0.5, 0.5)
  ENDIF
ENDIF