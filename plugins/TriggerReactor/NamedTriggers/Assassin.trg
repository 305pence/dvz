dwarves = array(100)
pu = 0
FOR player = getPlayers()
 IF $haspermission:"dwarf" && !($haspermission:"hero" || $haspermission:"plague")
  dwarves[pu] = player
  pu = pu + 1
 ENDIF
ENDFOR
AC = pu/9
IF AC == 0
 AC = 1
ENDIF
fails = 0

WHILE AC > 0
 player = dwarves[$random:0:pu]
 IF !($haspermission:"assassin") && player != null
  #MESSAGE "&cYou have been selected to be an assassin"
  #POTION "INCREASE_DAMAGE" 2000, 5
  #CMDCON "lp user $playername parent add assassin"
  #SCOREBOARD "TEAM" "lobby" "ADD" $playername
  AC = AC - 1
 ELSE
  fails = fails + 1
  IF fails == 50
   AC = 0
  ENDIF
 ENDIF
ENDWHILE
ASYNC
  FOR i = 0:24
    p = 0
    FOR player = getPlayers()
      IF $haspermission:"dwarf" && !($haspermission:"hero" || $haspermission:"plague" || $haspermission:"assassin")
        p = p + 1
      ENDIF
    ENDFOR
    IF p == 0
     #BREAK
    ENDIF
    count = toDouble($onlineplayers)
    IF p/count >= 2/3
      #WAIT 4
    ELSE
      FOR player = getPlayers()
        IF $haspermission:"assassin"
          #MESSAGE "&cGoodbye cruel world..."
          #KILL
        ENDIF
      ENDFOR
      IF {"MobRelease"} == false
       {"MobRelease"} = true
       #BROADCAST "&5#========================#"
       #BROADCAST "&5The Mobs Have Been Released"
       #BROADCAST "&5#========================#"
      ENDIF
      #STOP
    ENDIF
    IF i == 23
     pu = 0
     FOR player = getPlayers()
      IF $haspermission:"dwarf" && !($haspermission:"hero" || $haspermission:"plague" || $haspermission:"assassin")
       dwarves[pu] = player
       pu = pu + 1
      ENDIF
     ENDFOR
     fails = 0
     WHILE p/count >= 2/3
      u = $random:0:pu
      player = dwarves[pu]
      IF $haspermission:"dwarf" && !($haspermission:"hero" || $haspermission:"plague" || $haspermission:"assassin")
       #CMDCON "lp user $playername parent add assassin"
       #MESSAGE "&cA dark force invades your mind"
       #KILL
      ELSE
       fails = fails + 1
       IF fails == 50
        #BREAK
       ENDIF
      ENDIF
      p = 0
      FOR player = getPlayers()
       IF $haspermission:"dwarf" && !($haspermission:"hero" || $haspermission:"plague" || $haspermission:"assassin")
        p = p + 1
       ENDIF
      ENDFOR
     ENDWHILE
    ENDIF
  ENDFOR
  FOR player = getPlayers()
   IF $haspermission:"assassin" && !($isop)
     #MESSAGE "&cGoodbye cruel world..."
     #KILL
   ENDIF   
  ENDFOR
  IF {"MobRelease"} == false
   {"MobRelease"} = true
   #BROADCAST "&5#========================#"
   #BROADCAST "&5The Mobs Have Been Released"
   #BROADCAST "&5#========================#"
  ENDIF
ENDASYNC