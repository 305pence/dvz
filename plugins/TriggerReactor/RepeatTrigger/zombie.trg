IMPORT org.bukkit.entity.Zombie
IMPORT org.bukkit.HeightMap
IMPORT org.bukkit.entity.EntityType
IMPORT org.bukkit.Bukkit
IMPORT org.bukkit.util.Vector
IMPORT org.bukkit.Location
IF {"MobRelease"}
shrine = {"location.shrine"}
world = shrine.getWorld()
FOR monster = world.getEntitiesByClass(Zombie)
	IF monster.getTarget() == null
		SYNC
			monster.setSilent(true)
			monster.setHealth(0.0)
		ENDSYNC
	ENDIF
ENDFOR
m = Bukkit.getScoreboardManager()
team = m.getMainScoreboard().getTeam("monsters")
SYNC
FOR player = world.getPlayers()
	IF $haspermission:"monster"
		x = player.getLocation().getBlockX()
		z = player.getLocation().getBlockZ()
		y = player.getLocation().getBlockY()
		FOR i = 0:$random:3:6
			loc = Location($world, x, y, z)
			loc.add($random:-3:4, 0, $random:-3:4)
			IF world.getHighestBlockYAt(loc, HeightMap.MOTION_BLOCKING_NO_LEAVES) < y + 4
				spawnLoc = world.getHighestBlockAt(loc, HeightMap.MOTION_BLOCKING_NO_LEAVES).getLocation()
				spawnLoc.add(0.5, 0, 0.5)
				zombie = world.spawnEntity(spawnLoc, EntityType.ZOMBIE)
				zombie.setBaby(false)
				equipment = zombie.getEquipment()
				equipment.clear()
				helm = item("ZOMBIE_HEAD", 1)
				#SETATTRS helm, "GENERIC_ARMOR", 17, "HEAD", "GENERIC_MOVEMENT_SPEED", 0.1445, "HEAD", "GENERIC_ATTACK_DAMAGE", 3, "HEAD", "GENERIC_ARMOR_TOUGHNESS", 4000, "HEAD", "GENERIC_FOLLOW_RANGE", 10, "HEAD"
				vec = Vector()
				vec.setY(0.42)
				zombie.setVelocity(vec)
				equipment.setHelmet(helm)
				team.addEntry(zombie.getUniqueId().toString())
				equipment.setHelmetDropChance(0)
			ENDIF
		ENDFOR
	ENDIF
ENDFOR
ENDSYNC
ENDIF