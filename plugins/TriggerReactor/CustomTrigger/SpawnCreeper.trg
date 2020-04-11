IMPORT org.bukkit.event.block.Action

IF $idname:$helditem == "CREEPER_SPAWN_EGG" && $haspermission:"dead" && {"MobRelease"}
    #CMDCON "clearinventory $playername"
    #TP {"location.mobspawn"}
    #CMDCON "luckperms user $playername parent set creeper"
    #CMDCON "kit creeper $playername"
    #CALL "MobEffect"
ENDIF