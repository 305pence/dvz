SYNC
 IF trigger == "repeat" && {"UUID.game"} != "off"
  IF {"shrineDamage"} == 0 
   FOR c = 1:5
    gold = $getscore:"DvZ":"Gold" - 1
    h = 3
    IF $getscore:"DvZ":"Gold" <= 0
     h = 1
     gold = 0
    ENDIF
    IF {"shrine" + c} <= 30 - h && {"shrine" + c} != 0
     {"shrine" + c} = {"shrine" + c} + h
     FOR player = getPlayers()
      #SCOREBOARD "OBJ" "DvZ:dummy" "SET" "Gold" gold
     ENDFOR
    ELSEIF {"shrine" + c} != 0 && {"shrine" + c} != 30
     {"shrine" + c} = 30
     FOR player = getPlayers()
      #SCOREBOARD "OBJ" "DvZ:dummy" "SET" "Gold" gold
     ENDFOR
    ENDIF
   ENDFOR
   #CALL "ShrineHealth"
  ELSE
  {"shrineDamage"} = {"shrineDamage"} - 1
  ENDIF
 ENDIF
ENDSYNC