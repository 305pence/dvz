IMPORT java.lang.Integer
IMPORT java.lang.String
s = args[0].toUpperCase()
c = args[1]
IF {"lives." + s} == null
 #MESSAGE "typo?"
 #STOP
ENDIF
{"lives." + s} = Integer.parseInt(c)
#MESSAGE s +"s given " + c + " lives"