IF event.getAction().name() == "RIGHT_CLICK_BLOCK" || event.getAction().name() == "RIGHT_CLICK_AIR" || event.getItem() == null
 #STOP
ENDIF
IMPORT org.bukkit.Particle
item = event.getItem()
IF $idname:item == "NETHER_STAR" && item.getItemMeta().hasDisplayName()
 IF item.getItemMeta().getDisplayName() == "§6Nether Star"
  mana = 25 + ({"scoreboard.dwarves"}/3 + 1) * 4
  IF mana > 90
   mana = 90
  ENDIF
  IF $explevel >= mana
   player.setLevel($explevel - mana)
   #CLEARPOTION "ABSORPTION"
   #CLEARPOTION "REGENERATION"
   #POTION "ABSORPTION", 100000, 5
   #POTION "REGENERATION", 1200, 2
   #SOUNDALL player.getLocation(), "ENTITY_PLAYER_LEVELUP", 0.2, 2
   #COOLDOWN 0.5
   team = $getteam:player
   FOR player = player.getNearbyEntities(5, 2, 5)
    IF $getteam:player == team
     world = $world
     #POTION "REGENERATION", 120, 2
     #POTION "ABSORPTION", 100000, 1
     loc = player.getLocation()
     loc.add(0, 0.5, 0)
     world.spawnParticle(Particle.HEART, loc, 5, 0.5, 1, 0.5)
     #SOUND player.getLocation(), "ENTITY_PLAYER_LEVELUP", 0.2, 2
    ENDIF
   ENDFOR
  ELSE
   #MESSAGE "&3Not enough mana."
  ENDIF
 ENDIF
ENDIF