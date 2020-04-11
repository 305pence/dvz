IF trigger == "init"
 s = {"location.shrine"}
 shrine = s.clone()
 world = shrine.getWorld()
ENDIF
IF trigger == "repeat"
 FOR player = world.getPlayers()
  IF {?"sickness." + $playeruuid} == null
   {?"sickness." + $playeruuid} = 0
  ENDIF
  sick = {?"sickness." + $playeruuid}
  shrine.setY(player.getLocation().getY())
  IF $haspermission:"dwarf" && player.getLocation().distanceSquared(shrine) > 9216 && !($isop)
   sick = sick + 1
   IF sick <= 3
    #CLEARPOTION "REGENERATION"
    #POTION "WEAKNESS", 119, 1
    #MESSAGE "&cYou're too far away from the shrine (" + sick + ")"
   ELSEIF sick <= 6
    #CLEARPOTION "REGENERATION"
    #POTION "WEAKNESS", 119, 1
    #POTION "WITHER", 119, 5
    #MESSAGE "&cYou're too far away from the shrine (" + sick + ")"
   ELSE    
    #CLEARPOTION "REGENERATION"
    #POTION "WEAKNESS", 119, 1
    #POTION "WITHER", 119, 10
    IF $explevel >= 20
     player.setLevel($explevel - 20)
    ELSE
     player.setLevel(0)
    ENDIF
    #MESSAGE "&cYou're too far away from the shrine (" + sick + ") (enjoy death i guess)"
   ENDIF
  ELSE
   IF sick > 0
    sick = sick - 1
   ENDIF
  ENDIF
  {?"sickness." + $playeruuid} = sick
 ENDFOR
ENDIF