IF {"t"} < 29
 #MESSAGE "&a" + (29 - {"t"} ) + " minutes left."
ELSEIF {"t"} == 29
 #MESSAGE "&aLess than a minute left"
ELSE
 #MESSAGE "&aThe game has been going on for " +( {"t"} ) + " minutes"
ENDIF