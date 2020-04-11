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

IF $idname:$helditem == "SPIDER_SPAWN_EGG" && $haspermission:"dead" && {"MobRelease"}
    #CMDCON "clearinventory $playername"
    #TP {"location.mobspawn"}
    #CMDCON "luckperms user $playername parent set spider"
    #CALL "MobEffect"
    #POTION "JUMP", 200000, 3
    #POTION "SPEED", 200000, 1
    poison = item("SPLASH_POTION", 3)
    meta = poison.getItemMeta()
    meta.setBasePotionData(PotionData(PotionType.POISON, false, true))
    poison.setItemMeta(meta)
    fang = item("GOLDEN_AXE", 1)
    fMeta = fang.getItemMeta()
    fMeta.setUnbreakable(true)
    fang.setItemMeta(fMeta)
    #SETATTRS fang, Attribute.GENERIC_ATTACK_SPEED, -1, EquipmentSlot.HAND, Attribute.GENERIC_ATTACK_DAMAGE, 10, EquipmentSlot.HAND
    armor = item("MAGMA_CREAM", 1)
    aMeta = armor.getItemMeta()
    aMeta.addEnchant(Enchantment.BINDING_CURSE, 1, false)
    armor.setItemMeta(aMeta)
    #SETATTRS armor, Attribute.GENERIC_MAX_HEALTH, -14, EquipmentSlot.CHEST
    #SETITEMNAME "&fSpider Fang", fang
    #SETITEMNAME "nerfing cream?", armor
    #SETITEMLORE "Attack: Poisons dwarves with nausa or slowness\nRight Click: poison that corrodes walls", fang
    #SETITEMLORE "Attack: Poisons the dwarf &c&o(10 mana)", poison
    #SETPLAYERINV 38, armor
    #GIVE fang
    #GIVE poison
    web = item("COBWEB", 2)
    #SETITEMLORE "Attack: Wraps the attacked dwarf in a web", web
    #GIVE web
    #GIVE item("COOKED_BEEF", 10)
    #SETFOOD 20
ENDIF