IF event.getItem() == null
 #STOP
ENDIF

IF event.getItem().getType().name() == "NAUTILUS_SHELL"
 #COOLDOWN 300
 #SOUNDALL player.getLocation(), "EVENT_RAID_HORN", 10000, 1.1
 ASYNC
  #WAIT 2.3
  SYNC
  IMPORT org.bukkit.Particle
   FOR player = getPlayers()
    IF $haspermission: "dwarf"
     #CLEARPOTION "LUCK"
     #POTION "LUCK", 60, 1
     #SOUND player.getLocation(), "ENTITY_WITHER_HURT", 0.7, 0.5
     world = $world
     world.spawnParticle(Particle.VILLAGER_HAPPY, player.getLocation().getX(), (player.getLocation().getY() + 1), player.getLocation().getZ(), 20, 0.5, 0.5, 0.5)
    ENDIF
   ENDFOR
  ENDSYNC
 ENDASYNC
ENDIF