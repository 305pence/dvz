IMPORT org.bukkit.event.block.Action

IF event.getAction() != Action.LEFT_CLICK_AIR && event.getAction() != Action.LEFT_CLICK_BLOCK
    #STOP
ENDIF
IF $idname:$helditem == "ZOMBIE_SPAWN_EGG" && $haspermission:"dead" && {"MobRelease"}
    #CMDCON "clearinventory $playername"
    #CMDCON "warp monster $playername"
    #CMDCON "luckperms user $playername parent set zombie"
    #CMDCON "kit zombie $playername"
    #POTION "NIGHT_VISION" 200000 1
ENDIF