cause = event.getCause().name()
IMPORT org.bukkit.Particle
IF cause == "ENTITY_ATTACK" || cause == "ENTITY_SWEEP_ATTACK"
 player = entity
 IF entity.getType().name() == "ZOMBIE"
  player = event.getDamager()
  IF $haseffect:"LUCK"
   event.setDamage(1337)
   world = $world
   world.spawnParticle(Particle.VILLAGER_HAPPY, entity.getLocation().getX(), (entity.getLocation().getY() + 1), entity.getLocation().getZ(), 20, 0.5, 0.5, 0.5)
  ENDIF
 ELSEIF entity.getType().name() != "PLAYER"
  #STOP
 ELSEIF $haspermission:"monster" && !($haspermission:"unprocable")
  player = event.getDamager()
  IF $haseffect:"LUCK"
   event.setDamage(1337)
   world = $world
   world.spawnParticle(Particle.VILLAGER_HAPPY, entity.getLocation().getX(), (entity.getLocation().getY() + 1), entity.getLocation().getZ(), 20, 0.5, 0.5, 0.5)
  ENDIF
 ENDIF
ENDIF