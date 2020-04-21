IF {"UUID.game"} == "off"
 #CANCELEVENT
ENDIF
player = event.getEntity()
team = $getteam:player
IF team == null
 #STOP
ENDIF
cause = event.getCause().name()
IF team.getName() == "monsters" && cause == "FALL"
 #CANCELEVENT
ENDIF