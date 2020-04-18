cause = event.getCause().name()
IMPORT org.bukkit.Particle
IF cause == "ENTITY_ATTACK"
 entity = event.getEntity()
 IF $getteam:entity != $getteam:event.getDamager()
  player = event.getDamager()
  IF $haspermission:"speed"
   #CLEARPOTION "SPEED"
   #POTION "SPEED", 80, 3
  ENDIF
 ENDIF
ENDIF