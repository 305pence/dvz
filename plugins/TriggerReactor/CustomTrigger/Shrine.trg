IF event.getBlock().getType().name() == "ENCHANTING_TABLE"
 IF!($haspermission:"monster")
  #MESSAGE "why?"
  #CANCELEVENT
  #STOP
 ENDIF
 IF {"shrineHealth"} == 3 
  #BROADCAST "&c======================"
  #BROADCAST "&cTHE SHRINE HAS FALLEN"
  #BROADCAST "&c======================"
  #CALL "EndDvZ"
 ELSEIF !({"UUID.game"} == "off")
  {"shrineHealth"} = {"shrineHealth"} + 1
 ENDIF
ENDIF