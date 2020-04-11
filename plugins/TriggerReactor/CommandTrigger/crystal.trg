
IMPORT org.bukkit.entity.EntityType
world = $world
crystal = world.spawnEntity(player.getLocation(), EntityType.ENDER_CRYSTAL)
crystal.setInvulnerable(true)
crystal.setShowingBottom(false)