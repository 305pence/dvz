IMPORT org.bukkit.entity.EntityType
IMPORT java.lang.Math
IMPORT org.bukkit.Bukkit
IMPORT java.util.UUID
IMPORT org.bukkit.Color
world = Bukkit.getWorld("world")
pu = {"location.shrine"}
locS = pu.clone()
locS2 = pu.clone()
pu = {"location.mobspawn"} 
locM = pu.clone()
x = locM.getX() - locS.getX()
z = locM.getZ() - locS.getZ()
rAngle = Math.atan(x/z)
IF z < 0
 angle = Math.toRadians(180) + rAngle
ELSE
 angle = rAngle
ENDIF
locW = locS2.add(0, 20, 0)
locD = locS.add(64*Math.sin(angle), 15, 64*Math.cos(angle))
IF $onlineplayers < 10
 #CALL "Assassin"
ELSEIF $onlineplayers >= 10 && $onlineplayers < 200
 world.spawnEntity(locW, EntityType.WITHER)
ELSE
 dragon = world.spawnEntity(locD, EntityType.ENDER_DRAGON)
 phase = dragon.getPhase().getClass().getField("CHARGE_PLAYER").get(null)
 {"dragon.cooldown"} = 10
 dragon.setPhase(phase)
 {"dragon.phase"} = "NONE"
 {"dragon.dragon"} = dragon.getUniqueId().toString()
 #CMDCON "trg repeat DragonAIRepeat toggle"
ENDIF
//NOTE: delete the !() around the 2 player conditions after testing is done