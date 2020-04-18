SYNC
FOR player = getPlayers()
 IF trigger == "repeat"
  IF $haspermission:"mana" && !($haspermission:"hero")
   IF $explevel < 100
    level = $explevel + 1
   ELSE
    level = 100
   ENDIF
  ELSEIF $haspermission:"monster"
   IF $explevel < 98
    level = $explevel + 3
   ELSE
    level = 100
   ENDIF
  ELSEIF $haspermission:"witherwarrior"
   mana = 1 + ({"scoreboard.dwarves"}/3)
   IF mana > 15
    mana = 15
   ENDIF
   IF $explevel < 301 - mana
    level = $explevel + mana
   ELSE
    level = 300
   ENDIF
  ELSEIF $haspermission:"dragonborn"
   loc = {"location.shrine"}
   IF $world == loc.getWorld()
    IF player.getLocation().distanceSquared(loc) <= 25
     IF $getscore:"DvZ":"Gold" >= 50
      mana2 = 3
     ELSE
      mana2 = 1
     ENDIF
     IF $explevel < 601 - mana2
      level = mana2 + $explevel
     ELSE
      level = 600
     ENDIF
    ELSE
     level = $explevel
    ENDIF
   ELSE
    level = $explevel
   ENDIF
  ELSE
   #CONTINUE
  ENDIF
  mana = null
  mana2 = null
  player.setLevel(level)
 ENDIF
ENDFOR
ENDSYNC