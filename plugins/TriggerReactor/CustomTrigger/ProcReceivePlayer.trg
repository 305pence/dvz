IMPORT org.bukkit.Particle
cause = player.getLastDamageCause().getCause().name()
IF cause == "ENTITY_ATTACK" || cause == "ENTITY_SWEEP_ATTACK"
 player = player.getKiller()
 IF player == null
  #STOP
 ENDIF
 IF $haspermission:"dwarf" && ($helditemname == "DIAMOND_SWORD" || $helditemname == "IRON_SHOVEL" || $helditemname == "GOLDEN_SWORD" || $helditemname == "TRIDENT")
   #CLEARPOTION "LUCK"
   #SOUND player.getLocation(), "ENTITY_WITHER_HURT", 0.7, 0.5
   #POTION "LUCK", 45, 1
   world = $world
   world.spawnParticle(Particle.VILLAGER_HAPPY, player.getLocation().getX(), (player.getLocation().getY() + 1), player.getLocation().getZ(), 20, 0.5, 0.5, 0.5)
 ENDIF
ENDIF