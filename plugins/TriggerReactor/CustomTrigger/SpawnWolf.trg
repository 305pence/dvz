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

IF $idname:$helditem == "WOLF_SPAWN_EGG" && $haspermission:"dead" && {"MobRelease"} 
 IF {"lives.wolf"} > 0
    {"lives.wolf"} = {"lives.wolf"} - 1
    #CLEAR player
    #TP {"location.mobspawn"}
    #CMDCON "luckperms user $playername parent set wolf"
    #CALL "MobEffect"
    sword = item("IRON_SWORD", 1)
    sword2 = item("GOLDEN_SWORD", 1)
    sMeta = sword.getItemMeta()
    sMeta.setUnbreakable(true)
    sword.setItemMeta(sMeta)
    sword2.setItemMeta(sMeta)
    #SETATTRS sword, "GENERIC_ATTACK_SPEED", -1, "HAND", "GENERIC_ATTACK_DAMAGE", 7, "HAND"
    #SETATTRS sword2, "GENERIC_ATTACK_SPEED", -1, "HAND", "GENERIC_ATTACK_DAMAGE", 4, "HAND"
    armor = array(4)
    armor[3] = item("CHAINMAIL_HELMET", 1)
    armor[2] = item("CHAINMAIL_CHESTPLATE", 1)
    armor[1] = item("CHAINMAIL_LEGGINGS", 1)
    armor[0] = item("CHAINMAIL_BOOTS", 1)
    FOR i = 0:4
     #SETPLAYERINV 36+i, armor[i]
    ENDFOR
    #ENCHANT sword2, "FIRE_ASPECT", 2, "KNOCKBACK", 1 
    #GIVE sword
    #GIVE sword2
    #GIVE item("COOKED_BEEF", 20)
    #SETFOOD 20
    #SETHEALTH 20
 ELSE
  #MESSAGE "&3This mob has already been taken"
 ENDIF
ENDIF