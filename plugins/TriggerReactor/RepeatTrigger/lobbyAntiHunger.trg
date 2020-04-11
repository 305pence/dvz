RADIUS = 100
lobby = {"lobby"}
lobbyworld = lobby.getWorld()

FOR player = getPlayers()
  IF player.getLocation().getWorld().getName() != lobbyworld.getName()
    #CONTINUE
  ENDIF
  IF player.getLocation().distance(lobby) < RADIUS
    #SETFOOD 20
  ENDIF
ENDFOR
