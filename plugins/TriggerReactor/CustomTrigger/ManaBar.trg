IMPORT org.bukkit.Particle
IMPORT org.bukkit.Particle$DustOptions
IMPORT org.bukkit.Color
SYNC
	world = $world
	level = event.getNewLevel()
	IF $haspermission:"mana" && level <= 100 && (!($haspermission:"hero") || $isop)
		#SETXP level/100.0
		IF level <= 30 && {"MobRelease"}
			world.spawnParticle(Particle.REDSTONE, player.getLocation().getX(), player.getLocation().getY() + 1, player.getLocation().getZ(), 25, 0.2, 0.2, 0.2, DustOptions(Color.RED, 1))
		ENDIF
	ELSEIF $haspermission:"witherwarrior" && level <= 300
		#SETXP level/300.0
		IF level <= 75 && {"MobRelease"}
			world.spawnParticle(Particle.REDSTONE, player.getLocation().getX(), player.getLocation().getY() + 1, player.getLocation().getZ(), 25, 0.2, 0.2, 0.2, DustOptions(Color.RED, 1))
		ENDIF
	ELSEIF $haspermission:"dragonborn" && level <= 600
		#SETXP level/600.0
		IF level <= 125 && {"MobRelease"}
			world.spawnParticle(Particle.REDSTONE, player.getLocation().getX(), player.getLocation().getY() + 1, player.getLocation().getZ(), 25, 0.2, 0.2, 0.2, DustOptions(Color.RED, 1))
		ENDIF
	ENDIF
ENDSYNC