IF {"UUID.game"} == "off"
 #CANCELEVENT
ENDIF
player = event.getEntity()
team = $getteam:player
IF team == null
 #STOP
ENDIF
IF team.getName() == "monsters"
 #CANCELEVENT
ENDIF