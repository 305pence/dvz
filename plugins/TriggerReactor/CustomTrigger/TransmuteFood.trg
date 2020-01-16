IMPORT org.bukkit.event.block.Action

IF event.getAction() != Action.LEFT_CLICK_AIR && event.getAction() != Action.LEFT_CLICK_BLOCK
 #STOP
ENDIF
IF $idname:$helditem == "BOOK" && $lore:($helditem) == "Transmute Food" && $haspermission:"transmuteFood"
 IF $explevel >= 10
  IF takeItem(player, "BRICK", 15)
   #COOLDOWN 1
   player.setLevel($explevel - 10)
   #DROPITEM item("CAKE", 4), player.getLocation()
   #DROPITEM item("BREAD", $random:10:23), player.getLocation()
   IF $random:1:101 <= 3
    #DROPITEM item("ENCHANTED_GOLDEN_APPLE", 1), player.getLocation()
   ENDIF
  ELSE
   #MESSAGE "&615 Bricks &3are needed to transmute"
  ENDIF
 ELSE
  #MESSAGE "&3Not enough mana."
 ENDIF
ENDIF