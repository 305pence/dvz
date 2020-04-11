IF {"UUID.game"} != "off"
 player = event.getEntity()
 #CMDCON "lp user $playername parent set dead"
 #SCOREBOARD "TEAM" "lobby" "ADD" $playername
 #CALL "dwarfCounter"
 IF $haspermission:"dwarf"
  #BROADCAST player.getDisplayName() + " &4has been slain. &e(" {"scoreboard.dwarves"} " dwarves remaining)"
 ENDIF
 event.setDeathMessage(msg)
ENDIF