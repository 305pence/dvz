IMPORT org.bukkit.entity.Damageable
IMPORT org.bukkit.util.RayTraceResult
IMPORT org.bukkit.FluidCollisionMode
IMPORT org.bukkit.util.Vector
IF event.getItem() == null
 #STOP
ENDIF
item = event.getItem()
world = $world
IF $idname:item == "DIAMOND_HOE" && (event.getAction().name() == "LEFT_CLICK_AIR" || event.getAction().name() == "LEFT_CLICK_BLOCK")
 array = $array:"fire":"magic":"emerald":"sweep":"laser":"fire"
 FOR it = 0:5
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
 locSp = locC.add(locP.getDirection().multiply(2))
 ray = world.rayTraceEntities(locSp, player.getLocation().getDirection(), 100)
 IF ray == null
  #STOP
 ENDIF
 IF ray.getHitEntity() IS Damageable && $getteam:player != $getteam:ray.getHitEntity()
  IF $explevel >= 2
   IF takeItem(player, "ARROW", 1)
    player.setLevel($explevel - 3)
   ELSE
    #MESSAGE "&3Not enough arrows."
    #STOP
   ENDIF
  ELSE
   #MESSAGE "&3Not enough mana."
   #STOP 
  ENDIF
  #COOLDOWN 0.4
  #SOUND locP, "ITEM_FLINTANDSTEEL_USE", 0.7, 1
  #LASER locP, ray.getHitPosition().toLocation(world), "CRIT_MAGIC"
  entity = ray.getHitEntity()
  entity.damage(10, player)
 ENDIF
ENDIF

ENDIF
IF $idname:item == "DIAMOND_HOE" && (event.getAction().name() == "RIGHT_CLICK_AIR" || event.getAction().name() == "RIGHT_CLICK_BLOCK")
 locP = player.getLocation()
 locC = player.getLocation()
 locP.add(0, 1, 0)
 locC.add(0, 1.62, 0)
 IF hasLore(item, "fire")
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
 shooter = player
 team = $getteam:shooter
 FOR player = laserhit
  IF player IS Damageable && player != shooter
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
    IF $haspermission:"dwarf"
     #POTION "LUCK", 100, 1
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
ELSE
 #STOP
ENDIF

