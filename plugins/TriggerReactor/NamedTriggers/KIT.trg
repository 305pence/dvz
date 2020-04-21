// usage: #KIT player, mob kit
player = args[0]
name = args[1]
FOR i = 0:36
 IF i <= 3 && {"kit."+name+".armor."+i} != null
  slot = {"kit."+name+".armor."+i}
  #SETPLAYERINV i + 36, slot.clone()
 ENDIF
 IF {"kit."+name+".inv."+i} != null
  slot = {"kit."+name+".inv."+i}
  #GIVE slot.clone()
 ENDIF
ENDFOR
