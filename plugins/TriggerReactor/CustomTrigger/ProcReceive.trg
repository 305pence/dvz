IF entity.getType().name() == "ZOMBIE"
 IMPORT org.bukkit.Particle
 cause = entity.getLastDamageCause().getCause().name()
 IF cause == "ENTITY_ATTACK" || cause == "ENTITY_SWEEP_ATTACK"
  player = entity.getKiller()
  IF player == null
   #STOP
  ENDIF
  IF $haspermission:"dwarf" && ($helditemname == "DIAMOND_SWORD" || $helditemname == "IRON_SHOVEL" || $helditemname == "GOLDEN_SWORD")
    #CLEARPOTION "LUCK"
    #POTION "LUCK", 60, 1
    world = $world
    world.spawnParticle(Particle.VILLAGER_HAPPY, player.getLocation().getX(), (player.getLocation().getY() + 1), player.getLocation().getZ(), 20, 0.5, 0.5, 0.5)
   ENDIF
 ENDIF
ENDIF