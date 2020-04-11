IMPORT org.bukkit.util.Vector
IMPORT org.bukkit.entity.Damageable
IMPORT org.bukkit.Bukkit
cause = event.getCause().name()
IF cause == "ENTITY_ATTACK"
 player = event.getDamager()
 entity = event.getEntity()
 damage = event.getDamage()
 IF player.getType().name() != "PLAYER"
  #STOP
 ENDIF
 item = $helditem
 IF $helditemhasenchant:"SWEEPING_EDGE":5
  team = $getteam:player
  score = Bukkit.getScoreboardManager().getMainScoreboard()
  locE = entity.getLocation()
  FOR nearby = entity.getNearbyEntities(4, 4, 4)
   IF nearby.getType().name() == "PLAYER"
    name = nearby.getName()
   ELSE
    name = nearby.getUniqueId().toString()
   ENDIF
   IF score.getEntryTeam(name) != team && nearby IS Damageable && damage > 0 && event.getDamager() != nearby
    nearby.damage(damage * 0.5)
    RLoc = nearby.getLocation().subtract(locE)
    vec = RLoc.toVector().multiply(-0.12)
    vec.setY(vec.getY() + 0.45)
    nearby.setVelocity(vec)
   ENDIF
  ENDFOR
 ENDIF
ENDIF
   
 