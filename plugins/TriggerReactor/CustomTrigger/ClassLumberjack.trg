IMPORT org.bukkit.event.block.Action

IF event.getAction() != Action.LEFT_CLICK_AIR && event.getAction() != Action.LEFT_CLICK_BLOCK
    #STOP
ENDIF
IF $idname:$helditem == "MUSIC_DISC_WARD"
    #CMDCON "clearinventory $playername"
    #CMDCON "warp dwarf $playername"
    #CMDCON "luckperms user $playername parent set lumberjack"
    #CMDCON "kit lumberjack $playername"
    #SCOREBOARD "TEAM" "dwarves" "ADD" $playername
ENDIF