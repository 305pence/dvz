IMPORT org.bukkit.Material
IF event.item != null && $haspermission:"broodmother"
	IF event.item.getType().name() != "BOWL" && event.item.getType().name() != "SCUTE" 
		#STOP
	ENDIF
ELSE
	#STOP
ENDIF
IF event.action.name() == "RIGHT_CLICK_BLOCK" || event.action.name() == "RIGHT_CLICK_AIR" && event.item.getType().name() == "SCUTE"
	IF $explevel < 25
		#MESSAGE "&3Not enough mana"
		#STOP
	ENDIF
	player.setLevel($explevel - 25)
	#COOLDOWN 1
	#SOUNDALL player.getLocation(), "ENTITY_SILVERFISH_AMBIENT", 1, 0.7
	world = $world
	loc = player.getLocation()
	locX = loc.getBlockX()
	locY = loc.getBlockY()
	locZ = loc.getBlockZ()
	affectedBlocks = 0
	FOR x = -4:5
		FOR y = -4:5
			FOR z = -4:5
				block = world.getBlockAt(locX + x, locY + y, locZ + z)
				u = block.getType().name()
				IF u == "INFESTED_STONE_BRICKS" || u == "INFESTED_STONE" || u == "INFESTED_CRACKED_STONE_BRICKS" || u == "INFESTED_CHISELED_STONE_BRICKS" || u == "INFESTED_COBBLESTONE" || u == "INFESTED_COBBLESTONE"
					IF $random:0:8 == 0
						SYNC
							block.breakNaturally()
							affectedBlocks = affectedBlocks + 1
						ENDSYNC
					ENDIF
				ENDIF
			ENDFOR
		ENDFOR
	ENDFOR
	#MESSAGE "&3" + affectedBlocks +" silver fish have been awoken."
ENDIF
IF event.action.name() == "RIGHT_CLICK_BLOCK" && event.item.getType().name() == "BOWL"
	IF takeItem(player, "TURTLE_EGG", 1)
		#COOLDOWN 1
		#SOUNDALL player.getLocation(), "ENTITY_SILVERFISH_AMBIENT", 1, 0.7
		world = $world
		click = event.blockClicked
		locX = click.getX()
		locY = click.getY()
		locZ = click.getZ()
		affectedBlocks = 0
		FOR x = -1:2
			FOR y = -1:2
				FOR z = -1:2
					block = world.getBlockAt(locX + x, locY + y, locZ + z)
					u = block.getType().name()
					IF u == "STONE_BRICKS" || u == "STONE" || u == "CRACKED_STONE_BRICKS" || u == "CHISELED_STONE_BRICKS" || u == "COBBLESTONE" || u == "COBBLESTONE"
						SYNC
							block.setType(Material.getMaterial("INFESTED_" + u))
							affectedBlocks = affectedBlocks + 1
						ENDSYNC
					ENDIF
				ENDFOR
			ENDFOR
		ENDFOR
		#MESSAGE "&3" + affectedBlocks + " eggs have been layed"
	ENDIF
ENDIF
IF (event.action.name() == "LEFT_CLICK_BLOCK" || event.action.name() == "LEFT_CLICK_AIR") && event.item.getType().name() == "BOWL"
	IF $explevel >= 100
		IF !(player.getInventory().contains(Material.TURTLE_EGG))
			player.setLevel($explevel - 100)
			#GIVE item("TURTLE_EGG", 4)
		ELSE
			#MESSAGE "&3Use your eggs first before getting new ones"
		ENDIF
	ELSE
		#MESSAGE "&3Not enough mana."
	ENDIF
ENDIF

