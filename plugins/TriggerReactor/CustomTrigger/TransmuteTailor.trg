IMPORT org.bukkit.event.block.Action

IF event.getAction() != Action.LEFT_CLICK_AIR && event.getAction() != Action.LEFT_CLICK_BLOCK
 #STOP
ENDIF
IF $haspermission:"transmuteArmor" && $idname:$helditem == "BOOK" && $lore:($helditem) == "Transmute Armor"
 IF $explevel >= 10
  IF takeItem(player, "ORANGE_DYE", 5)
    #COOLDOWN 1
    player.setLevel($explevel - 10)
    #DROPITEM item("GOLD_ORE", 12), player.getLocation()
    IF $random:1:3 == 2
		item = item("DIAMOND_HELMET", 1)
		#SETATTRS item, "GENERIC_ARMOR", 3, "HEAD", "GENERIC_ARMOR_TOUGHNESS", 6, "HEAD"
		#DROPITEM item, player.getLocation()
    ENDIF
    IF $random:1:3 == 2
		item = item("DIAMOND_CHESTPLATE", 1)
		#SETATTRS item, "GENERIC_ARMOR", 8, "CHEST", "GENERIC_ARMOR_TOUGHNESS", 6, "CHEST"
		#DROPITEM item, player.getLocation()
    ENDIF
    IF $random:1:3 == 2
		item = item("DIAMOND_LEGGINGS", 1)
		#SETATTRS item, "GENERIC_ARMOR", 6, "LEGS", "GENERIC_ARMOR_TOUGHNESS", 6, "LEGS"
		#DROPITEM item, player.getLocation()
    ENDIF
    IF $random:1:3 == 2
		item = item("DIAMOND_BOOTS", 1)
		#SETATTRS item, "GENERIC_ARMOR", 3, "FEET", "GENERIC_ARMOR_TOUGHNESS", 6, "FEET"
		#DROPITEM item, player.getLocation()
    ENDIF
    rL = $random:1:101
    IF rL <= 5
		item = item("DIAMOND_HELMET", 1)
		#SETATTRS item, "GENERIC_ARMOR", 3, "HEAD", "GENERIC_ARMOR_TOUGHNESS", 6, "HEAD", "GENERIC_KNOCKBACK_RESISTANCE", 0.5, "HEAD"
		#ENCHANT item, "PROTECTION_ENVIRONMENTAL", 2, "DURABILITY", 3, "OXYGEN", 3, "WATER_WORKER", 1
		#DROPITEM item, player.getLocation()
    ELSEIF rL <= 10
		item = item("DIAMOND_CHESTPLATE", 1)
		#SETATTRS item, "GENERIC_ARMOR", 8, "CHEST", "GENERIC_ARMOR_TOUGHNESS", 6, "CHEST"
		#ENCHANT item, "PROTECTION_ENVIRONMENTAL", 2, "PROTECTION_EXPLOSIONS", 4, "DURABILITY", 6, "THORNS", 3
		#DROPITEM item, player.getLocation()
    ELSEIF rL <= 15
		item = item("DIAMOND_LEGGINGS", 1)
		#SETATTRS item, "GENERIC_ARMOR", 6, "LEGS", "GENERIC_ARMOR_TOUGHNESS", 6, "LEGS", "GENERIC_MAX_HEALTH", 4, "LEGS"
		#ENCHANT item, "PROTECTION_PROJECTILE", 4, "PROTECTION_ENVIRONMENTAL", 2, "DURABILITY", 3
		#DROPITEM item, player.getLocation()
    ELSEIF rL <= 20
		item = item("DIAMOND_BOOTS", 1)
		#SETATTRS item, "GENERIC_ARMOR", 3, "FEET", "GENERIC_ARMOR_TOUGHNESS", 6, "FEET", "GENERIC_MOVEMENT_SPEED", 0.015, "FEET"
		#ENCHANT item, "PROTECTION_ENVIRONMENTAL", 2, "PROTECTION_FALL", 5, "DEPTH_STRIDER", 3, "DURABILITY", 3
		#DROPITEM item player.getLocation()
    ENDIF
  ELSE
   #MESSAGE "&65 Orange dye &3is required to transmute."
  ENDIF
 ELSE
  #MESSAGE "&3Not enough mana."
 ENDIF
ENDIF