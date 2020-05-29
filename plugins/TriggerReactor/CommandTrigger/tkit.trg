IMPORT java.lang.String

IF args.length < 2
 #MESSAGE "usage: /tkit {class name} {armor/inv}"
 #STOP
ENDIF

name = args[0].toUpperCase()
inv = player.getInventory()

IF {"lives." + name} == null
 kitType = "other, not mob"
ELSE
 kitType = "mob"
ENDIF

IF args[1] == "inv"
 c = 36
ELSEIF args[1] == "armor"
 c = 4
ELSE
 #MESSAGE "inv or armor"
 #STOP
ENDIF
pu = 0
FOR i = 0:c
 IF inv.getItem(i) != null
  {"kit." + name + "." + args[1] + "." + i} = inv.getItem(i).clone()
 ELSE
  {"kit." + name + "." + args[1] + "." + i} = null
 ENDIF
 IF inv.getItem(i) != null
  pu = pu + 1
 ENDIF
ENDFOR
#MESSAGE "&3"+pu+" items have added to the "+ name +"'s " + args[1] + ". (" + kitType + ")"