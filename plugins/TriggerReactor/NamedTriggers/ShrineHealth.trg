IMPORT org.bukkit.NamespacedKey
IMPORT org.bukkit.Bukkit
IMPORT org.bukkit.boss.BarColor
IMPORT org.bukkit.boss.BarFlag
bar = Bukkit.getBossBar(NamespacedKey.minecraft("pingas"))
health = 0
FOR c = 1:5
 health = {"shrine" + c} + health
ENDFOR
bar.setProgress(health/120.0)
IF health == 0  
 bar.addFlag(BarFlag.DARKEN_SKY)
 bar.addFlag(BarFlag.CREATE_FOG)
 #BROADCAST "&c#===================#"
 #BROADCAST "&cThe Shrine has fallen!"
 #BROADCAST "&c#===================#"
 #CMDCON "trg repeat manaTest toggle"
 #CMDCON "trg repeat shrine toggle"
 FOR player = getPlayers()
  IF $haspermission:"dwarf"
   player.setLevel(0)
  ENDIF
 ENDFOR
 ASYNC
  #WAIT 16
  #CMDCON "trg repeat manaTest toggle"
  #CMDCON "trg repeat shrine toggle"
  #CALL "EndDvZ"
 ENDASYNC
ELSEIF health <= 30
 bar.setColor(BarColor.RED)
ELSE
 bar.setColor(BarColor.BLUE)
ENDIF