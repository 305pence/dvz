IMPORT org.bukkit.event.block.Action
IF event.getItem() == null
 #STOP
ENDIF
IF event.getClickedBlock() != null
 IF event.getClickedBlock().getType().name() == "CAULDRON"
  #STOP
 ENDIF
ENDIF
IF event.getItem().getType().name() == "POTION" && $haspermission:"dwarf"
 item = event.getItem()
 meta = item.getItemMeta()
 potion = meta.getBasePotionData()
 IF meta.hasCustomEffects()
  IF $explevel >= 30
   pu = meta.getCustomEffects()
   #COOLDOWN 2
   #SOUND player.getLocation(), "ENTITY_GENERIC_DRINK", 0.2, 1
   player.setLevel($explevel - 30)
   FOR effect = pu
    type = effect.getType()
    player.removePotionEffect(type)
    player.addPotionEffect(effect)
   ENDFOR
  ELSE
   #MESSAGE "&3Not enough mana."
  ENDIF
 ELSEIF potion.getType().getEffectType() != null
  pu = potion.getType().getEffectType().getName()
  IF pu == "HEAL" || pu == "INCREASE_DAMAGE" || pu == "FIRE_RESISTANCE" || pu == "SPEED"
   mana = 20
   share = true
   cd = 1.0
   IF potion.isUpgraded()
    p = 1800
    u = 2
   ELSEIF potion.isExtended()
    p = 9600
    u = 1
   ELSE
    p = 3600
    u = 1
   ENDIF
   IF potion.getType().isInstant()
    p = 1
	IF $haspermission:"dragonborn"
     u = u + 2
	ELSE
	 u 
	ENDIF
    mana = 6
    IF $haspermission:"witherwarrior"
     mana = 180
    ELSEIF $haspermission:"dragonborn"
     mana = 25
    ENDIF
    share = false
    cd = 0.5
   ENDIF
   IF $explevel >= mana
    #COOLDOWN cd
    player.setLevel($explevel - mana)
    #CLEARPOTION pu
    #POTION pu, p, u
    #SOUNDALL player.getLocation(), "ENTITY_GENERIC_DRINK", 0.2, 1
    IF potion.getType().isInstant()
     #POTION "REGENERATION", 40, 3
     #SOUND player.getLocation(), "ENTITY_PLAYER_LEVELUP", 0.2, 2
    ENDIF
    IF share
     IMPORT org.bukkit.entity.EntityType
     IMPORT org.bukkit.util.Vector
     IMPORT java.lang.Math
     world = $world
     loc = player.getLocation()
     locY = loc.getY() + 1.5
     loc.setY(locY)
     snowball = world.spawnEntity(loc, EntityType.SNOWBALL) 
     snowball.setCustomName("potion")
     uuid = snowball.getUniqueId()
     {?uuid + ".effect"} = pu
     {?uuid + ".time"} = p
     {?uuid + ".potency"} = u
     v = Vector()
     x = -1 * Math.cos(Math.toRadians(player.getLocation().getPitch())) * Math.sin(Math.toRadians(player.getLocation().getYaw()))
     v.setX(x)
     z = Math.cos(Math.toRadians(player.getLocation().getPitch())) * Math.cos(Math.toRadians(player.getLocation().getYaw()))
     v.setZ(z)
     y = -1 * Math.sin(Math.toRadians(player.getLocation().getPitch()))
     v.setY(y)
     snowball.setVelocity(v)
    ENDIF
   ELSE
    #MESSAGE "&3Not enough mana."
   ENDIF
  ENDIF
 ENDIF
ENDIF