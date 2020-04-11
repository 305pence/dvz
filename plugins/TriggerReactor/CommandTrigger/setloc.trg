IF argslength > 0
 IF args[0] == "shrine" || args[0] == "mobspawn" || args[0] == "lobby" || args[0] == "quarry"
  {"location." + args[0]} = player.getLocation()
  #MESSAGE args[0] + " &3has been set"
 ELSE
  #MESSAGE "&cinvalid location"
  #STOP
 ENDIF
ELSE
 #MESSAGE "&cyou must specifiy what location you want set &3(shrine, mobspawn, lobby, quarry)"
ENDIF
 