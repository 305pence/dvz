IMPORT org.bukkit.entity.Damageable
IMPORT org.bukkit.util.RayTraceResult
IMPORT org.bukkit.FluidCollisionMode
IMPORT org.bukkit.util.Vector
IMPORT org.bukkit.Sound
IF event.getItem() == null
 #STOP
ENDIF
item = event.getItem()
world = $world
IF $idname:item == "DIAMOND_HOE" && (event.getAction().name() == "LEFT_CLICK_AIR" || event.getAction().name() == "LEFT_CLICK_BLOCK")
 array = $array:"laser":"random":"laser"
 FOR it = 0:2
  IF hasLore(item, array[it])
   #COOLDOWN 0.3
   #SETITEMLORE array[it + 1], item
   #MESSAGE "&3Mode set to " + array[it + 1]
   #STOP
  ENDIF
 ENDFOR
ENDIF
IF $idname:item == "DIAMOND_HOE" && (event.getAction().name() == "RIGHT_CLICK_AIR" || event.getAction().name() == "RIGHT_CLICK_BLOCK") && hasLore(item, "laser")
 locP = player.getLocation()
 locC = player.getLocation()
 locP.add(0, 1, 0)
 locC.add(0, 1.62, 0)
 locSp = locC.add(locP.getDirection().multiply(2.5))
 ray = world.rayTraceEntities(locSp, player.getLocation().getDirection(), 100)
 IF ray == null
  #STOP
 ENDIF
 IF ray.getHitEntity() IS Damageable && $getteam:player != $getteam:ray.getHitEntity()
  IF $explevel >= 0
   IF takeItem(player, "ARROW", 1)
    player.setLevel($explevel - 0)
   ELSE
    #MESSAGE "&3Not enough arrows."
    #STOP
   ENDIF
  ELSE
   #MESSAGE "&3Not enough mana."
   #STOP 
  ENDIF
  #COOLDOWN 0.4
  #SOUNDALL locP, "ENTITY_BEE_STING", 10, 2
  #SOUND locP, "ENTITY_ARROW_HIT_PLAYER", 1, 1
  #LASER locP, ray.getHitPosition().toLocation(world), "CRIT_MAGIC"
  entity = ray.getHitEntity()
  entity.damage(10, player)
  #STOP
 ELSE
  #STOP
 ENDIF
ENDIF
ENDIF
IF $idname:item == "DIAMOND_HOE" && (event.getAction().name() == "RIGHT_CLICK_AIR" || event.getAction().name() == "RIGHT_CLICK_BLOCK")
 locP = player.getLocation()
 locC = player.getLocation()
 locP.add(0, 1, 0)
 locC.add(0, 1.62, 0)
 IF hasLore(item, "random")
  r = $random:1:101
  IF r <= 8
   lore = "sweep"
  ELSEIF r <= 38
   lore = "emerald"
  ELSEIF r <= 68
   lore = "magic"
  ELSE
   lore = "fire"
  ENDIF
 ELSE
  lore = $lore:item
 ENDIF
 #SETITEMLORE lore, item
 IF hasLore(item, "fire")
  sound = "ENTITY_BLAZE_SHOOT"
  volume = 10
  pitch = 0.8
  mana = 4
  arrow = 1
  cd = 1
  damagev = 15
  par = "FLAME"
  thic = 0.10
  flc = FluidCollisionMode.ALWAYS
  pass = true
  range = 60
 ELSEIF hasLore(item, "magic")
  pitch = 1.6
  sound = "ENTITY_SQUID_SQUIRT"
  volume = 10
  mana = 6
  arrow = 1
  cd = 1
  damagev = 10
  par = "SPELL_WITCH"
  thic = 0.2
  flc = FluidCollisionMode.NEVER
  pass = true
  range = 30
 ELSEIF hasLore(item, "emerald")
  pitch = 0.5
  sound = "ENTITY_WITHER_HURT"
  volume = 0.7
  mana = 5
  arrow = 2
  cd = 2
  damagev = 5
  par = "VILLAGER_HAPPY"
  thic = 0.25
  flc = FluidCollisionMode.NEVER
  pass = true
  range = 60
 ELSEIF hasLore(item, "sweep")
  pitch = 2
  sound = "ENTITY_EVOKER_CAST_SPELL"
  volume = 10
  mana = 16
  arrow = 8
  cd = 5
  damagev = 30
  par = "ENCHANTMENT_TABLE"
  thic = 0.50
  flc = FluidCollisionMode.NEVER
  pass = false
  range = 5
 ELSE
  #STOP
 ENDIF
 IF $explevel >= mana
  IF takeItem(player, "ARROW", arrow)
   player.setLevel($explevel - mana)
  ELSE
   #MESSAGE "&3Not enough arrows."
   #STOP
  ENDIF
 ELSE
  #MESSAGE "&3Not enough mana."
  #STOP
 ENDIF
 ray = world.rayTraceBlocks(locC, player.getLocation().getDirection(), range, flc, pass)
 IF ray == null
  locR = locP.clone()
  dirP = locR.getDirection().multiply(range)
  locR.add(dirP)
 ELSE
  locR = ray.getHitPosition().toLocation(world)
 ENDIF
 laserhit = $LASER:locP:locR:par:thic:null:true
 #COOLDOWN cd
 #SOUNDALL locP, sound, volume, pitch
 shooter = player
 team = $getteam:shooter
 FOR player = laserhit
  IF player IS Damageable && player != shooter
   shooter.playSound(shooter.getLocation(), Sound.ENTITY_ARROW_HIT_PLAYER, 1, 1)
   dummy = player
   IF hasLore(item, "fire") && $getteam:player != team
    player = dummy
    player.damage(damagev)
    #BURN 5
   ELSEIF hasLore(item, "magic") && $getteam:player != team
    player = dummy
    player.damage(damagev)
    #POTION "SLOW", 100, 4
    #POTION "WEAKNESS", 200, 1
   ELSEIF hasLore(item, "emerald")
    player.damage(damagev, shooter)
    IF $getteam:player == team
     player = dummy
     #POTION "LUCK", 100, 1
     #SOUND player.getLocation(), "ENTITY_WITHER_HURT", 1, 0.5
    ENDIF
   ELSEIF hasLore(item, "sweep") && $getteam:player != team
    #POTION "LUCK", 1, 1
    player = dummy
    player.damage(damagev, shooter)
    vec = player.getVelocity()
    vec.multiply(7)
    player.setVelocity(vec)
   ENDIF
  ENDIF
 ENDFOR
 #SETITEMLORE "random", item
ELSE
 #STOP
ENDIF

