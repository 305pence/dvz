IMPORT org.bukkit.Bukkit
entity = event.getEntity()
m = Bukkit.getScoreboardManager()
team = m.getMainScoreboard().getTeam("monsters")
IF event.getSpawnReason().name() == "SPAWNER_EGG" || event.getSpawnReason().name() == "SILVERFISH_BLOCK"
 player = entity
 #POTION "DAMAGE_RESISTANCE", 1000000, 4
 #POTION "INCREASE_DAMAGE", 100000, 3
 #POTION "SPEED", 1000000, 3
 #POTION "FIRE_RESISTANCE", 100000
 team.addEntry(entity.getUniqueId().toString())
ENDIF 