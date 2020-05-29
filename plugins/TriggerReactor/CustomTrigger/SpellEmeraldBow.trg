IF event.item == null
 #STOP
ENDIF
item = event.item
IF item.getType().name() == "CROSSBOW" && hasLore(item, "R-Click to use 5 mana") && !(item.getItemMeta().hasChargedProjectiles())
	#COOLDOWN 5
	#CANCELEVENT
	#CLEARPOTION "SLOW"
	#POTION "SLOW" 60 5
	ASYNC
		#WAIT 3
		IMPORT org.bukkit.potion.PotionType
		IMPORT org.bukkit.potion.PotionData
		IMPORT org.bukkit.util.RayTraceResult
		IMPORT org.bukkit.FluidCollisionMode
		IMPORT org.bukkit.util.Vector
		IF ($helditem == item|| $offhanditem == item) && !(item.getItemMeta().hasChargedProjectiles())
			IF takeItem(player, "ARROW", 3)
			world = $world
				FOR i = 0:3
					SYNC
					player = event.getPlayer()
					locP = player.getLocation()
					locC = player.getLocation()
					locP.add(0, 1, 0)
					locC.add(0, 1.62, 0)
					pitch = 2
					sound = "BLOCK_NOTE_BLOCK_PLING"
					volume = 1
					damagev = 9
					par = "VILLAGER_HAPPY"
					thic = 0.25
					flc = FluidCollisionMode.NEVER
					pass = true
					range = 60
					ray = world.rayTraceBlocks(locC, player.getLocation().getDirection(), range, flc, pass)
					IF ray == null
						locR = locP.clone()
						dirP = locR.getDirection().multiply(range)
						locR.add(dirP)
					ELSE
						locR = ray.getHitPosition().toLocation(world)
					ENDIF
					laserhit = $LASER:locP:locR:par:thic:null:true
					#SOUNDALL locP, sound, volume, pitch
					shooter = player
					team = $getteam:shooter
						IMPORT org.bukkit.Sound
						IMPORT org.bukkit.entity.Damageable
						FOR player = laserhit
							IF player IS Damageable && player != shooter
								dummy = player
								SYNC
									dummy.damage(damagev, shooter)
								ENDSYNC
								IF $getteam:player == team
									SYNC
										player = dummy
										#POTION "LUCK", 100, 1
										#SOUND player.getLocation(), "ENTITY_WITHER_HURT", 1, 0.5
									ENDSYNC
								ENDIF
							ENDIF
						ENDFOR
					ENDSYNC
					#wait 0.5
				ENDFOR
			ELSE
				#MESSAGE "&3Not enough arrows"
			ENDIF
		ENDIF
	ENDASYNC
ENDIF