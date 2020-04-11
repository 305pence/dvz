IMPORT org.bukkit.event.block.Action

IF event.getAction() != Action.LEFT_CLICK_AIR && event.getAction() != Action.LEFT_CLICK_BLOCK
    #STOP
ENDIF
IF $idname:$helditem == "MUSIC_DISC_STRAD"
    #CMDCON "clearinventory $playername"
    #TP {"location.shrine"}
    #CMDCON "luckperms user $playername parent set tailor"
    #CMDCON "kit tailor $playername"
    #SCOREBOARD "TEAM" "dwarves" "ADD" $playername
    #SCOREBOARD "OBJ" "dragonDamage:dummy" "SET" $playername 0
    #SCOREBOARD "OBJ" "witherDamage:dummy" "SET" $playername 0
    #SETGAMEMODE 0
    ASYNC
     #CALL "dwarfCounter"
    ENDASYNC
ENDIF