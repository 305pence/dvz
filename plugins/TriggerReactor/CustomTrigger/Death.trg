IF {"UUID.game"} != "off"
 #SCOREBOARD "TEAM" "lobby" "ADD" $playername
 IF $haspermission:"enderman"
  {"portal.enderman"} = null
 ENDIF
 IF $haspermission:"dwarf"
  IF player.getKiller() == null
   #BROADCAST player.getDisplayName() + " &4has been slain. &e(" {"scoreboard.dwarves"} - 1" dwarves remaining)"
  ELSE
   #BROADCAST player.getDisplayName() + " &4has been slain by &c"+ player.getKiller().getName() +"&4. &e(" {"scoreboard.dwarves"} - 1" dwarves remaining)"
  ENDIF
 ENDIF
 #UNDISGUISE
 #CMDCON "lp user $playername parent set dead"
 #CALL "dwarfCounter" //do at the end (until i fix the player thing)
ENDIF