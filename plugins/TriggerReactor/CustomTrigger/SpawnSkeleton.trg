IMPORT org.bukkit.event.block.Action

IF $idname:$helditem == "SKELETON_SPAWN_EGG" && $haspermission:"dead" && {"MobRelease"}
    #CMDCON "clearinventory $playername"
    #TP {"location.mobspawn"}
    #CMDCON "luckperms user $playername parent set skeleton"
    #CMDCON "kit skeleton $playername"
    #CALL "MobEffect"
ENDIF