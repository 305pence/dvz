IMPORT org.bukkit.inventory.ItemFlag
player = args[0]
kit = array(5)
armor = array(4)
slot = array(4)
sword = item("GOLDEN_SWORD", 1)
sMeta = sword.getItemMeta()
bow = item("BOW", 1)
bMeta = bow.getItemMeta()
horn = item("NAUTILUS_SHELL", 1)
sMeta.setUnbreakable(true)
sMeta.addItemFlags(ItemFlag.HIDE_ATTRIBUTES)
bMeta.setUnbreakable(true)
sword.setItemMeta(sMeta)
bow.setItemMeta(bMeta)
#SETITEMNAME "&6Excalaju", sword
#SETITEMNAME "&6Dragon Skin Bow", bow
#SETITEMNAME "&6Horn of the Buffalo", horn
#SETITEMLORE "&6Hero Item\nRight Click: Runedash (20 second cooldown)\n \n&7When in main hand:\n &22 Attack Speed\n &210 Attack Damage", sword
#SETITEMLORE "&6Hero Item\nMobs killed give a PROC.", bow
#SETITEMLORE "&6Hero Item\nLeft Click: Fills dwarves with vigor (300 second cooldown)", horn
#ENCHANT sword, "SWEEPING_EDGE", 3
#ENCHANT bow, "ARROW_DAMAGE", 7, "ARROW_KNOCKBACK", 10, "ARROW_INFINITE", 1
#SETATTRS sword, "GENERIC_ATTACK_SPEED", -2, "HAND", "GENERIC_ATTACK_DAMAGE", 9, "HAND"
kit[0] = sword
kit[1] = bow
kit[2] = horn
kit[3] = item("MILK_BUCKET", 10)
kit[4] = item("GOLDEN_APPLE", 10)
armor[3] = item("GOLDEN_HELMET", 1)
armor[2] = item("GOLDEN_CHESTPLATE", 1)
armor[1] = item("GOLDEN_LEGGINGS", 1)
armor[0] = item("GOLDEN_BOOTS", 1)
slot[0] = "FEET"
slot[1] = "LEGS"
slot[2] = "CHEST"
slot[3] = "HEAD"
FOR i = 0:5
 #GIVE kit[i]
ENDFOR
FOR i = 0:4
 #SETATTRS armor[i], "GENERIC_ARMOR", 5, slot[i], "GENERIC_ARMOR_TOUGHNESS", 4, slot[i], "GENERIC_MAX_HEALTH", 5, slot[i], "GENERIC_KNOCKBACK_RESISTANCE", 0.25, slot[i]
 #ENCHANT armor[i], "PROTECTION_ENVIRONMENTAL", 2, "PROTECTION_FALL", 1, "BINDING_CURSE", 1, "VANISHING_CURSE", 1
 aMeta = armor[i].getItemMeta()
 aMeta.setUnbreakable(true)
 armor[i].setItemMeta(aMeta)
 #SETPLAYERINV 36+i, armor[i]
ENDFOR
 
