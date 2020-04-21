IF event.getDamager().getType().name() != "PLAYER"
 #STOP
ENDIF
player = event.getDamager()
IF $haspermission:"spider"
 IF $helditemname == "GOLDEN_AXE" || $helditemname == "STONE_AXE"
  r = $random:1:4
  player = entity
  IF r == 1
   #POTION "SLOW" 100, 1
  ELSEIF r == 2
   #POTION "CONFUSION" 100, 1
  ENDIF
   #COOLDOWN 1
 ELSEIF $helditemname == "SPLASH_POTION"
  IF $explevel >= 10
   player.setLevel($explevel - 10)
   player = entity
   #CLEARPOTION "POISON"
   #POTION "POISON", 100, 2
   #COOLDOWN 1
  ELSE
   #MESSAGE "&3You do not have enough mana"
  ENDIF
 ENDIF
ENDIF