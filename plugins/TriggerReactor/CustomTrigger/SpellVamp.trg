cause = event.getCause().name()
IMPORT org.bukkit.Particle
IF cause == "ENTITY_ATTACK"
 entity = event.getEntity()
 IF $getteam:entity != $getteam:event.getDamager()
  player = event.getDamager()
  IF $haspermission:"vamp"
   IF $maxhealth < $health + 2
    h = $maxhealth
   ELSE
    h = $health + 2
   ENDIF
   #SETHEALTH h
  ENDIF
 ENDIF
ENDIF