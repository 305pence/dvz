IMPORT org.bukkit.event.block.Action

IF event.getAction() != Action.LEFT_CLICK_AIR && event.getAction() != Action.LEFT_CLICK_BLOCK
    #STOP
ENDIF
IF $idname:$helditem == "MUSIC_DISC_CHIRP"
    #CMDOP "clearinventory"
    #CMDOP "warp dwarf"
    #CMDOP "luckperms user $playername parent set baker"
    #CMDOP "kit baker"
ENDIF