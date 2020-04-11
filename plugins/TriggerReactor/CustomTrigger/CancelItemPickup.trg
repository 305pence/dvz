IMPORT org.bukkit.event.entity.EntityPickupItemEvent
player = event.getEntity()
IF !($haspermission:"dwarf")
 #CANCELEVENT
ENDIF