player = event.getDamager()
IF event.getDamager().getType().name() != "PLAYER"
 #STOP
ENDIF
IF $haspermission:"spider"
 IF $helditemname == "COBWEB"
  item = item("COBWEB", 1)
  #SETITEMLORE "Attack: Wraps the attacked dwarf in a web", item
  takeItem(player, item, 1)
  world = $world
  player = entity
  loc = player.getLocation()
  x = loc.getBlockX()
  y = loc.getBlockY()
  z = loc.getBlockZ()
  FOR y2 = y:(y+2)
   FOR x2 = (x-1):(x+2)
    block = world.getBlockAt(x2, y2, z)
    IF block.isEmpty()
     #SETBLOCK "COBWEB", x2, y2, z
    ENDIF
   ENDFOR
   FOR z2 = (z-1):(2+z)
    block = world.getBlockAt(x, y2, z2)
    IF block.isEmpty()
     #SETBLOCK "COBWEB", x, y2, z2
    ENDIF
   ENDFOR
  ENDFOR
  #POTION "SLOW_DIGGING", 50, 3
  #COOLDOWN 5
 ENDIF
ENDIF