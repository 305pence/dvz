IMPORT org.bukkit.entity.EntityType
IF trigger == "repeat"
 IF {"t"} == 29
  {"t"} = {"t"} + 1
  #CALL "MobRelease"
 ELSE
  {"t"} = {"t"} + 1
 ENDIF
 #CALL "dwarfCounter"
 IF {"MobRelease"} == true
  v = EntityType.values()
  FOR array = v
   IF array.isAlive()
    mob = array.toString()
    IF {"lives." + mob} == null || (mob == "ZOMBIE" || mob == "SKELETON" || mob == "SPIDER" || mob == "CREEPER")
     #CONTINUE
    ENDIF
    r = {"rarity.chance." + mob}
    IF $random:1:101 <= r
     {"lives." + mob} = {"rarity.count."+ mob}
    ENDIF
   ENDIF
  ENDFOR
 ENDIF
ENDIF