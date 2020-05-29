IMPORT org.bukkit.event.block.Action

IF event.getAction() != Action.LEFT_CLICK_AIR && event.getAction() != Action.LEFT_CLICK_BLOCK
 #STOP
ENDIF
IF $haspermission:"builder" && $idname:$helditem == "BOOK" && $lore:($helditem) == "Transmute Stone Bricks"
	IF $explevel >= 15
		player.setLevel($explevel - 15)
		IF {"MobRelease"}
			string = "CRACKED_STONE_BRICKS"
		ELSE
			string = "STONE_BRICKS"
		ENDIF
		#DROPITEM item(string, 32), player.getLocation()
		#COOLDOWN 1
	ENDIF
ENDIF