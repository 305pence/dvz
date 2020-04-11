
SYNC
level = event.getNewLevel()
IF $haspermission:"mana" && level <= 100 && (!($haspermission:"hero") || $isop)
 #SETXP level/100.0
ELSEIF $haspermission:"witherwarrior" && level <= 300
 #SETXP level/300.0
ELSEIF $haspermission:"dragonborn" && level <= 600
 #SETXP level/600.0
ENDIF
ENDSYNC