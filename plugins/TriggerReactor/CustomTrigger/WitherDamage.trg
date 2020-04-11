IF event.getEntityType().name() == "WITHER"
 damage = event.getFinalDamage()
 IF event.getDamager().getType().name() == "ARROW"
  player = event.getDamager().getShooter()
 ELSE
  player = event.getDamager()
 ENDIF
 IMPORT org.bukkit.Bukkit
 m = Bukkit.getScoreboardManager() 
 score = m.getMainScoreboard().getObjective("witherDamage").getScore($playername).getScore() 
 #SCOREBOARD "OBJ" "witherDamage:dummy" "SET" $playername (damage + score)
ENDIF