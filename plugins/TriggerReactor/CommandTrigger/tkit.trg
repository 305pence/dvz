IMPORT java.lang.String

IF args.length < 2
 #MESSAGE "usage: /tkit {class name} {armor/inv}"
 #STOP
ENDIF

name = args[0].toUpperCase()
inv = player.getInventory()

IF {"lives." + name} == null
 #MESSAGE "&3This class does not exist my boy"
 #STOP
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
 {"kit." + name + "." + args[1] + "." + i} = inv.getItem(i)
 IF inv.getItem(i) != null
  pu = pu + 1
 ENDIF
ENDFOR
#MESSAGE "&3"+pu+" items have added to the "+ name +"'s " + args[1]