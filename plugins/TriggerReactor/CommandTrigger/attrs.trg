IF args.length < 3
	#MESSAGE "usage: hold an item and type /attrs (attribute name) (ammount) (slot)"
	#STOP
ENDIF
IF args.length == 3
	#SETATTRS $helditem, args[0], args[1], args[2]
ENDIF
IF args.length == 6
	#SETATTRS $helditem, args[0], args[1], args[2], args[3], args[4], args[5]
ENDIF
IF args.length == 9
	#SETATTRS $helditem, args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8]
ENDIF
IF args.length == 12
	#SETATTRS $helditem, args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11]
ENDIF