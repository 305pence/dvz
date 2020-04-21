IMPORT java.lang.String
i = $helditemname
IF i.contains("_SPAWN_EGG")
 IF args.length == 0
  args = array(1)
  args[0] = "pu"
 ENDIF
 i2 = i.replaceAll("_SPAWN_EGG", "")
 i3 = i2.toLowerCase()
 IF args[0] != "del"
  {"lives." + i2} = 1
  #CMDCON "lp creategroup " + i3
  #CMDCON "lp group " + i3 + " parent set monster"
  #CMDCON "lp group " + i3 + " permission set " + i3
  #MESSAGE "&3The mob &r" + i2 + " &3has been created"
 ELSE
  {"lives." + i2} = null
  #MESSAGE "&3Although the kit for &r"+i2+" &3remains, the server no longer sees &r"+i2+" &3as \"existent\""
 ENDIF
ELSE
 #MESSAGE i+" does not contain _SPAWN_EGG"
ENDIF