IMPORT org.bukkit.event.block.Action

IF event.getAction() != Action.LEFT_CLICK_AIR && event.getAction() != Action.LEFT_CLICK_BLOCK
    #STOP
ENDIF
IF $idname:$helditem == "MUSIC_DISC_CHIRP"
    #CMDOP "clearinventory $playername"
    #CMDOP "warp dwarf $playername"
    #CMDOP "luckperms user $playername parent set baker"
    #CMDOP "kit baker $playername"
    #SCOREBOARD "TEAM" "dwarves" "ADD" $playername
ENDIF