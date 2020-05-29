IMPORT java.lang.String
IMPORT org.bukkit.entity.EntityType

IF args.length < 1
 #MESSAGE "type name of mob after pls"
ENDIF
name = args[0].toUpperCase()
 #CLEAR player
 #KIT player, name