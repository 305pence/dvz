IMPORT org.bukkit.Material
IF event.getHitBlock() == null
 #STOP
ENDIF
IF event.getHitBlock().getType().name() == "END_STONE" && event.getEntity().getType().name() == "ARROW"
 IF $random:1:17 == 1
  drop = event.getHitBlock().breakNaturally()
 ENDIF
ENDIF