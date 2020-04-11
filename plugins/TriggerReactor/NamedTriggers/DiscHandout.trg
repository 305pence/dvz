#MESSAGE "&3(Ward is lumberjack)"
#GIVE item("MUSIC_DISC_WARD", 1)
IF $random:4 == 2
 #GIVE item("MUSIC_DISC_BLOCKS", 1)
 #MESSAGE "&3(Blocks is blacksmith)"
ENDIF
IF $random:4 == 2
 #GIVE item("MUSIC_DISC_STRAD", 1)
 #MESSAGE "&3(Strad is tailor)"
ENDIF
IF $random:4 == 2
 #GIVE item("MUSIC_DISC_CHIRP", 1)
 #MESSAGE "&3(Chirp is baker)"
ENDIF
IF $random:5 == 3
 #GIVE item("MUSIC_DISC_WAIT", 1)
 #MESSAGE "&3(Wait is alchemist)"
ENDIF
#MESSAGE "&3Left click a disc to select a class"
