IMPORT org.bukkit.event.block.Action

IF event.getAction() != Action.LEFT_CLICK_AIR && event.getAction() != Action.LEFT_CLICK_BLOCK
    #STOP
ENDIF
IF $idname:$helditem == "MUSIC_DISC_BLOCKS"
    #SETGAMEMODE 0
    #CMDCON "clearinventory $playername"
    #TP {"location.shrine"}
    #CMDCON "luckperms user $playername parent set blacksmith"
    #CMDCON "kit blacksmith $playername"
    #SCOREBOARD "TEAM" "dwarves" "ADD" $playername
    #SCOREBOARD "OBJ" "dragonDamage:dummy" "SET" $playername 0
    #SCOREBOARD "OBJ" "witherDamage:dummy" "SET" $playername 0
    ASYNC
     #CALL "dwarfCounter"
    ENDASYNC
ENDIF