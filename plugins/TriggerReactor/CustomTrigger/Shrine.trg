IMPORT org.bukkit.Particle
IF event.getAction().name() != "LEFT_CLICK_BLOCK"
 #STOP
ENDIF
block = event.getClickedBlock()
locB = block.getLocation()
IF block.getType().name() == "ENCHANTING_TABLE" && $haspermission:"monster" && player.getLocation().distanceSquared(locB) <= 3
 FOR c = 1:5
  loc = {"location.shrine" + c}
  IF locB.equals(loc.getBlock().getLocation())
   IF {"shrine" + c} > 1
    {"shrine" + c} = {"shrine" + c} - 1
   ELSEIF {"shrine" + c} == 1
    {"shrine" + c} = 0
    #SETBLOCK "AIR", locB.getBlockX(), locB.getBlockY(), locB.getBlockZ()
    #EXPLOSION locB.getWorld().getName(), locB.getBlockX(), locB.getBlockY(), locB.getBlockZ(), 1.0
    world = $world
    world.spawnParticle(Particle.EXPLOSION_HUGE, locB, 1)
   ENDIF
   {"shrineDamage"} = 2
   IF !($isop)
    #COOLDOWN 0.75
   ENDIF
   #CALL "ShrineHealth"
   #STOP
  ENDIF
 ENDFOR
ENDIF