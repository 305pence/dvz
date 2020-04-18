IMPORT org.bukkit.event.block.Action
IMPORT org.bukkit.potion.PotionData
IMPORT org.bukkit.potion.PotionType
IMPORT org.bukkit.inventory.EquipmentSlot
IMPORT org.bukkit.attribute.Attribute
IMPORT org.bukkit.attribute.AttributeModifier
IMPORT org.bukkit.enchantments.Enchantment
IF event.getAction() != Action.LEFT_CLICK_AIR && event.getAction() != Action.LEFT_CLICK_BLOCK
 #STOP
ENDIF

IF $idname:$helditem == "ZOMBIE_VILLAGER_SPAWN_EGG" && $haspermission:"dead" && {"MobRelease"} 
 IF {"lives.zombievillager"} > 0
    {"lives.zombievillager"} = 0
    #CLEAR player
    #TP {"location.mobspawn"}
    #CMDCON "luckperms user $playername parent set zombievillager"
    #POTION "SLOW", 200000, 1
    #POTION "HEALTH_BOOST", 200000, 5
    #CALL "MobEffect"
    axe = item("DIAMOND_AXE", 1)
    aMeta = axe.getItemMeta()
    aMeta.setUnbreakable(true)
    axe.setItemMeta(aMeta)
    #SETATTRS axe, "GENERIC_ATTACK_SPEED", -2.4, "HAND", "GENERIC_ATTACK_DAMAGE", 9, "HAND", "GENERIC_KNOCKBACK_RESISTANCE", 1, "HAND"
    armor = array(4)
    armor[3] = item("DIAMOND_HELMET", 1)
    armor[2] = item("DIAMOND_CHESTPLATE", 1)
    armor[1] = item("DIAMOND_LEGGINGS", 1)
    armor[0] = item("DIAMOND_BOOTS", 1)
    FOR i = 0:4
     #SETPLAYERINV 36+i, armor[i]
    ENDFOR
    #SETITEMNAME "&fYe ol' door chopper", axe
    #ENCHANT axe, "SWEEPING_EDGE", 5
    #GIVE axe
    #GIVE item("WOODEN_HOE", 1)
    #GIVE item("COOKED_BEEF", 10)
    #SETFOOD 20
    #SETHEALTH 40
 ELSE
  #MESSAGE "&3This mob has already been taken"
 ENDIF
ENDIF