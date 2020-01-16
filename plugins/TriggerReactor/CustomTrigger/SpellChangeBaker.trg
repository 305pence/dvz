IMPORT org.bukkit.event.block.Action

IF event.getAction() != Action.RIGHT_CLICK_AIR && event.getAction() != Action.RIGHT_CLICK_BLOCK || event.getHand().name() != "HAND"
 #STOP
ENDIF
IF $idname:$helditem == "BOOK" && $lore:($helditem) == "Transmute Clay" && $haspermission:"transmuteFood"
 #COOLDOWN 0.5
 #SETITEMLORE "Transmute Food", $helditem
 #MESSAGE "&3Transmute Food spell selected"
 #STOP
ENDIF
IF $idname:$helditem == "BOOK" && $lore:($helditem) == "Transmute Food" && $haspermission:"transmuteClay"
 #COOLDOWN 0.5
 #SETITEMLORE "Transmute Clay", $helditem
 #MESSAGE "&3Transmute Clay spell selected"
ENDIF
