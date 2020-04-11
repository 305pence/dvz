IF $helditemlore:1 == "Contains the gear of the Dragon Born" && $haspermission:"dragonborn"
 IF $emptyslots >= 10
  #DragonBornKit player
  #SETHELDITEM item("AIR", 1)
 ELSE
  #MESSAGE "&cYour inventory is too full to recive the kit"
 ENDIF
ELSEIF $helditemlore:1 == "Contains the gear of the Wither Warrior" && $haspermission:"witherwarrior"
 IF $emptyslots >= 10
  #WitherWarriorKit player
  #SETHELDITEM item("AIR", 1)
 ELSE
  #MESSAGE "&cYour inventory is too full to recive the kit"
 ENDIF
ENDIF
