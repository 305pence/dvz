IMPORT org.bukkit.potion.PotionData
IMPORT org.bukkit.event.block.Action
IMPORT org.bukkit.potion.PotionType

IF event.getAction() != Action.LEFT_CLICK_AIR && event.getAction() != Action.LEFT_CLICK_BLOCK
 #STOP
ENDIF

IF $helditemname == "BOOK" && $lore:($helditem) == "Transmute Potions" && $haspermission:"alchemist"
#COOLDOWN 1
IF $explevel >= 10
 potion = PotionData(PotionType.MUNDANE)
 item = item("POTION", 1)
 itemMeta = item.getItemMeta()
 itemMeta.setBasePotionData(potion)
 item.setItemMeta(itemMeta)
 IF takeItem(player, item, 3)
  player.setLevel($explevel - 10)
  pu = player.getLocation()
  #DROPITEM item("BONE", $random:3:9), pu
  #DROPITEM item("MILK_BUCKET", 1), pu
  #DROPITEM item("SAND", 9), pu
  FOR i = 0:3
   r = $random:1:101
   IF r <= 50
    #CMDCON "give $playername potionofhealing 1"
   ELSEIF r <= 70
    #CMDCON "give $playername potionofspeed 1"
   ELSEIF r <= 90
    #CMDCON "give $playername potionofstrength 1"
   ELSE 
    #CMDCON "give $playername potionoffireres 1"
   ENDIF
  ENDFOR
 ELSE
  #MESSAGE "&63 Mundane Potions &3are required to transmute."
 ENDIF
ELSE
 #MESSAGE "&3Not enough mana."
ENDIF
ENDIF