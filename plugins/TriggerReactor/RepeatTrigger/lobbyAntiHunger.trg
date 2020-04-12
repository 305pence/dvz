RADIUS = 100*100
lobby = {"location.lobby"}
lobbyworld = lobby.getWorld()

FOR player = getPlayers()
  IF player.getLocation().getWorld().getName() != lobbyworld.getName()
    #CONTINUE
  ENDIF
  IF player.getLocation().distanceSquared(lobby) < RADIUS
    #SETFOOD 20
  ENDIF
ENDFOR
