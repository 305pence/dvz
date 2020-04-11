IF $isop
 #STOP
ENDIF

s = {"location.shrine"}
x = block.getX()
y = block.getY()
z = block.getZ()
IF (x <= s.getBlockX() + 4 && x >= s.getBlockX() - 3) && (y <= s.getBlockY() + 9) && (z <= s.getBlockZ() + 4 && z >= s.getBlockZ() - 3)
 IF block.getType().name() != "ENCHANTING_TABLE" 
  #MESSAGE "&3This block is protected."
  #CANCELEVENT
 ENDIF
ENDIF