IF $random:4 == 2  
 i = item("MUSIC_DISC_BLOCKS", 1)
 #SETITEMNAME "&c&lBlacksmith", i
 #GIVE i
ENDIF
IF $random:4 == 2
 i = item("MUSIC_DISC_STRAD", 1)
 #SETITEMNAME "&f&lTailor", i
 #GIVE i
ENDIF
IF $random:4 == 2
 i = item("MUSIC_DISC_CHIRP", 1)
 #SETITEMNAME "&4&lBaker", i
 #GIVE i
ENDIF
IF $random:5 == 3
 i = item("MUSIC_DISC_WAIT", 1)
 #SETITEMNAME "&3&lAlchemist", i
 #GIVE i
ENDIF
i = item("MUSIC_DISC_WARD", 1)
#SETITEMNAME "&2&lLumberjack", i
#GIVE i
