FOR player = getPlayers()
IF trigger == "repeat"
 IF $haspermission:"mana" && $isop == false
  IF $explevel < 100
   SYNC
    player.setLevel($explevel + 1)
   ENDSYNC
  ENDIF
  SYNC
   IF $explevel > 100
    player.setLevel(100)
   ENDIF
  ENDSYNC
 ENDIF
 IF $haspermission:"monster"
  IF $explevel < 98
   SYNC
    player.setLevel($explevel + 3)
   ENDSYNC
  ELSE
   SYNC
    player.setLevel(100)
   ENDSYNC
  ENDIF
 ENDIF
ENDIF
ENDFOR