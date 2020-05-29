IMPORT org.bukkit.inventory.ItemFlag
player = args[0]
kit = array(5)
armor = array(4)
slot = array(4)
sword = item("STONE_SWORD", 1)
sMeta = sword.getItemMeta()
bow = item("CROSSBOW", 1)
bMeta = bow.getItemMeta()
horn = item("NETHER_STAR", 1)
sMeta.setUnbreakable(true)
sMeta.addItemFlags(ItemFlag.HIDE_ATTRIBUTES)
bMeta.setUnbreakable(true)
sword.setItemMeta(sMeta)
bow.setItemMeta(bMeta)
#SETITEMNAME "&6Withering Blade", sword
#SETITEMNAME "&6Crossword", bow
#SETITEMNAME "&6Nether Star", horn
#SETITEMLORE "&6Hero Item\nLeft Click: 2 block radius AOE\nRight Click: idk probably something similar to an SOS\n \n&7When in main hand:\n &22 Attack Speed\n &27 Attack Damage\n &21 Knockback Resistance", sword
#SETITEMLORE "&6Hero Item\nCrossbow\n           i\n           t\n           h\n           e\n           r\n   Warrior\n Shoots Withering arrows", bow
#SETITEMLORE "&6Hero Item\nLeft Click: Absorption and regen\nRight Click: Regrowth beam, heals health and armor (20 mana)\nMana regen and heal cost depends on the ammount of dwarves", horn
#ENCHANT sword, "SWEEPING_EDGE", 5
#ENCHANT bow, "PIERCING", 4, "QUICK_CHARGE", 3, "MULTISHOT", 1
#SETATTRS sword, "GENERIC_ATTACK_SPEED", -2, "HAND", "GENERIC_ATTACK_DAMAGE", 6, "HAND", "GENERIC_KNOCKBACK_RESISTANCE", 1, "HAND"
kit[0] = sword
kit[1] = bow
kit[2] = horn
kit[3] = item("MILK_BUCKET", 10)
kit[4] = item("COOKED_BEEF", 32)
armor[3] = item("WITHER_SKELETON_SKULL", 1)
armor[2] = item("DIAMOND_CHESTPLATE", 1)
armor[1] = item("DIAMOND_LEGGINGS", 1)
armor[0] = item("DIAMOND_BOOTS", 1)
values = $array:3:6:8:3
slot = $array:"FEET":"LEGS":"CHEST":"HEAD"
FOR i = 0:6
 #GIVE kit[i]
ENDFOR
FOR i = 0:4
 #ENCHANT armor[i], "PROTECTION_ENVIRONMENTAL", 3, "DURABILITY", 3
 #SETATTRS armor[i] "GENERIC_ARMOR", values[i], slot[i], "GENERIC_ARMOR_TOUGHNESS", 6, slot[i], "GENERIC_MAX_HEALTH", 2, slot[i]
 #SETITEMLORE "&6Hero Item", armor[i]
 #SETPLAYERINV 36+i, armor[i]
ENDFOR
 
