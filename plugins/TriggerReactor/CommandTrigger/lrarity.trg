IMPORT java.lang.String
IMPORT java.lang.Integer
IF args.length < 3
 #MESSAGE "usage: /lrarity (mob) (rarity) (count)"
ENDIF
mob = args[0].toUpperCase()
{"rarity.chance."+mob} = Integer.parseInt(args[1])
{"rarity.count."+mob} = Integer.parseInt(args[2])
#MESSAGE "rarity and count set for " + mob