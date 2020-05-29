IF (event.getAction().name() != "RIGHT_CLICK_AIR" && event.getAction().name() != "RIGHT_CLICK_BLOCK") || event.getItem() == null
	#STOP
ENDIF
IMPORT org.bukkit.entity.EntityType
IF event.getItem().getType().name() == "GOLDEN_AXE"
	IF $explevel >= 8
		#COOLDOWN 0.6
		player.setLevel($explevel - 8)
		world = $world
		vector = player.getLocation().getDirection()
		loc = player.getLocation()
		loc.setY(loc.getY() + 1)
		pearl = world.spawnEntity(loc, EntityType.ENDER_PEARL)
		pearl.setVelocity(vector)
	ELSE
		#MESSAGE "&3Not enough mana."
	ENDIF
ENDIF