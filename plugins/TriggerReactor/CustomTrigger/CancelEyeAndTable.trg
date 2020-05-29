IF $isop
	#STOP
ENDIF


IF event.getClickedBlock() != null
 IF event.getClickedBlock().getType().name() == "ENCHANTING_TABLE" && $haspermission:"monster"
  #CANCELEVENT
 ENDIF
ENDIF

IF event.getItem() == null
 #STOP
ENDIF
IF event.getItem().getType().name() == "ENDER_EYE"
 #CANCELEVENT
ENDIF
