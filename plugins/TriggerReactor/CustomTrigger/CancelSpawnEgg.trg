IMPORT org.bukkit.event.block.Action

IF event.getAction() != Action.RIGHT_CLICK_AIR && event.getAction() != Action.RIGHT_CLICK_BLOCK
 #STOP
ENDIF

IF $haspermission:"dead" && !($isop)
 #CANCELEVENT
ENDIF