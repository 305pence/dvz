IF $helditemname != "ENDER_EYE" || event.getHand().name() == "OFFHAND" || $isop
 #STOP
ENDIF
IMPORT org.bukkit.util.Vector
world = $world
IF $helditemlore:1 == "Contains the gear of the Dragon Born" && $haspermission:"dragonborn"
 IF $emptyslots >= 10
  #DragonBornKit player
  #SETHELDITEM item("AIR", 1)
 ELSE
  #MESSAGE "&cYour inventory is too full to recive the kit"
 ENDIF
ELSEIF $helditemlore:1 == "Contains the gear of the Wither Warrior" && $haspermission:"witherwarrior"
 IF $emptyslots >= 10
  #WitherWarriorKit player
  #SETHELDITEM item("AIR", 1)
 ELSE
  #MESSAGE "&cYour inventory is too full to recive the kit"
 ENDIF
ENDIF
IF $haspermission:"monster" && $helditemname == "ENDER_EYE"
 IF $helditemdisplayname == "§5Portal Maker"
  IF player.getLocation().distanceSquared({"location.shrine"}) <= 4096
   item = $helditem
   IF !(item.getItemMeta().hasEnchants() || {"portal.state"})
    {"portal.enderman"} = player
    shrine = {"location.shrine"}
    #TP player.getLocation().toVector().setY(shrine.getY() + 29).toLocation(world)
	#CMDOP "/cyl minecraft:end_stone 5"
    #SETBLOCK "GOLD_BLOCK", player.getLocation()	//player.getLocation().toVector().add(Vector(0, -1, 0)).toLocation(world)
    #ENCHANT $helditem, "MENDING", 1
    #TP player.getLocation().toVector().add(Vector(0, 1, 0)).toLocation(world)
    {"portal.location"} = player.getLocation()
    #BROADCAST "&5@============================@"
    #BROADCAST "&5An enderman portal has been opened!"
    #BROADCAST "&5@============================@"
    #GIVE item("BLAZE_SPAWN_EGG", 5)
    #GIVE item("SKELETON_SPAWN_EGG", 10)
    #GIVE item("ENDERMAN_SPAWN_EGG", 5)
   ELSE
    IF {"portal.state"}
	 #MESSAGE "The portal is already opened"
	 #STOP
	ELSE
	 IF $explevel >= 10
      player.setLevel($explevel - 10)
     ELSE
	  #MESSAGE "&4Not enough mana"
	  #STOP
	 ENDIF
	ENDIF
   ENDIF
   portal = {"portal.location"}
   integ = 0
   world = portal.getWorld()
   pz = portal.getBlockZ()
   px = portal.getBlockX()
   py = portal.getBlockY() - 1
   FOR x = -5:6
    FOR z = -5:6
 	 block = world.getBlockAt(px + x, py , pz + z)
	 IF block.getType().name() == "END_STONE" || block.getType().name() == "GOLD_BLOCK"
      integ = integ + 1
	 ENDIF
    ENDFOR
   ENDFOR
   #TP portal.toVector().setY(portal.getY() - 1).toLocation(world)
   decay = 1 - (integ/61.0)
   IF decay >= 2/3.4
    #MESSAGE "&5The portal is too damaged to be relit again"
	#COOLDOWN 4
	#STOP
   ENDIF
   #CMDOP "/hcyl minecraft:end_gateway 2"
   IF decay <= 1/3.0
    #CMDOP "/hcyl minecraft:end_gateway 4"
   ENDIF
   #TP portal
   {"portal.state"} = true
   #LIGHTNING $worldname, portal.getX(), portal.getY(), portal.getZ() 
   #POTION "FIRE_RESISTANCE", 600, 1
   #POTION "REGENERATION", 600, 1
   #POTION "SLOW", 600, 3
   #COOLDOWN 30
   #STOP
  ELSE
   #MESSAGE "&cGet closer to the shrine before making a portal"
  ENDIF
 ELSEIF {"portal.state"}
  IF $explevel >= 15
   player.setLevel($explevel - 15)
   #POTION "SLOW", 100, 3
   #POTION "WEAKNESS", 80, 1
   portal = {"portal.location"} 
   world = portal.getWorld()
   pz = portal.getBlockZ()
   px = portal.getBlockX()
   py = portal.getBlockY() - 1
   gates = set()
   FOR x = -5:6
    FOR z = -5:6
     block = world.getBlockAt(px + x, py , pz + z)
   	 IF block.getType().name() == "END_GATEWAY"
  	  gates.add(block)
  	 ENDIF
    ENDFOR
   ENDFOR
   gates = gates.toArray()
   IF gates.length == 0
    #MESSAGE "No gates to teleport to"
    #SETHELDITEM item("AIR", 1)
    #STOP
   ENDIF
   gate = gates[$random:0:gates.length].getLocation()
   gate.add(0.5, 0.5, 0.5)
   #TP gate
   #SETHELDITEM item("AIR", 1)
   player = {"portal.enderman"}
   IF player != null
    IF $explevel >= 2
     player.setLevel($explevel - 4)
	ELSE
	 player.setLevel(0)
	ENDIF
   ENDIF
  ELSE
   #MESSAGE "&cNot enough mana"
  ENDIF
 ELSE 
  #MESSAGE "&cThe portal is no longer active"
  #SETHELDITEM item("AIR", 1)
 ENDIF
ENDIF