IMPORT org.bukkit.event.block.Action

IF event.getAction() != Action.LEFT_CLICK_AIR && event.getAction() != Action.LEFT_CLICK_BLOCK
 #STOP
ENDIF
IF $haspermission:"transmuteArmor" && $idname:$helditem == "BOOK" && $lore:($helditem) == "Transmute Armor"
 IF $explevel >= 10
  IF takeItem(player, "ORANGE_DYE", 5)
   IF takeItem(player, "DIAMOND", 4)
    #COOLDOWN 1
    player.setLevel($explevel - 10)
    #DROPITEM item("GOLD_ORE", 12), player.getLocation()
    IF $random:1:3 == 2 ; #DROPITEM item("DIAMOND_HELMET", 1), player.getLocation()
    ENDIF
    IF $random:1:3 == 2 ; #DROPITEM item("DIAMOND_CHESTPLATE", 1), player.getLocation()
    ENDIF
    IF $random:1:3 == 2 ; #DROPITEM item("DIAMOND_LEGGINGS", 1), player.getLocation()
    ENDIF
    IF $random:1:3 == 2 ; #DROPITEM item("DIAMOND_BOOTS", 1), player.getLocation()
    ENDIF
    rL = $random:1:101
    IF rL <= 3
     #DROPITEM "DIAMOND_HELMET", 1, "DURABILITY:3,OXYGEN:3,WATER_WORKER:1,PROTECTION_ENVIRONMENTAL:4", player.getLocation()
    ELSEIF rL <= 6
     #DROPITEM "DIAMOND_CHESTPLATE", 1, "PROTECTION_EXPLOSIONS:4,DURABILITY:3,PROTECTION_ENVIRONMENTAL:4", player.getLocation()
    ELSEIF rL <= 9
     #DROPITEM "DIAMOND_LEGGINGS", 1, "PROTECTION_PROJECTILE:4,DURABILITY:3,PROTECTION_ENVIRONMENTAL:4", player.getLocation()
    ELSEIF rL <= 12
     #DROPITEM "DIAMOND_BOOTS", 1, "DURABILITY:3,PROTECTION_FALL:5,DEPTH_STRIDER:3,PROTECTION_ENVIRONMENTAL:4", player.getLocation()
    ENDIF
   ELSE
    #MESSAGE "&65 Orange dye &3and &64 Diamonds &3are required to transmute."
    #DROPITEM item("ORANGE_DYE", 5), player.getLocation()
   ENDIF
  ELSE
   #MESSAGE "&65 Orange dye &3and &64 Diamonds &3are required to transmute."
  ENDIF
 ELSE
  #MESSAGE "&3Not enough mana."
 ENDIF
ENDIF