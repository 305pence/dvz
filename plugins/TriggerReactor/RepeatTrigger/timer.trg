IF trigger == "repeat"
 IF {"t"} == 29
  {"t"} = {"t"} + 1
  #CALL "MobRelease"
 ELSE
  {"t"} = {"t"} + 1
 ENDIF
 #CALL "dwarfCounter"
 IF {"MobRelease"} == true
  IF $random:1:8 == 7
   {"lives.zombievillager"} = 1
  ENDIF
 ELSE
  {"lives.zombievillager"} = 0
 ENDIF
ENDIF