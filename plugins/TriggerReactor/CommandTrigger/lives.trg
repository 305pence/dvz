IMPORT java.lang.Integer
s = args[0]
c = args[1]
IF {"lives." + s} == null
 #MESSAGE "typo?"
 #STOP
ENDIF
{"lives." + s} = Integer.parseInt(c)
#MESSAGE s +"s given " + c + " lives"