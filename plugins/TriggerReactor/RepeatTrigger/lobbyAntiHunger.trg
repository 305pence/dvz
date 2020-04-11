RADIUS = 40

FOR player = getPlayers()
  IF player.getLocation().distance({"lobby"}) < RADIUS
    #SETFOOD 20
  ENDIF
ENDFOR