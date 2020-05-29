IMPORT java.lang.Integer
IMPORT java.lang.String
IF trigger == "init"
	c = 40
	countdown = c
	lastdoom = null
	lobby = {"location.lobby"}
ENDIF
IF trigger == "repeat" && {"MobRelease"}
		IMPORT org.bukkit.Bukkit
		m = Bukkit.getScoreboardManager()
		clock = m.getMainScoreboard().getObjective("DvZ").getScore("Doom Clock")
	score = $getscore:"DvZ":"Doom Clock"
	IF score != null && score > 0
		clock.setScore(score - 1)
		countdown = c
	ELSEIF score != null && score == 0
		IF countdown == null
			countdown = 40
		ENDIF
		IF countdown > 0
			FOR player = getPlayers()
				IF countdown % 3 == 1
					#SOUND player.getLocation() "ENTITY_LIGHTNING_BOLT_THUNDER" 1 0.7
				ENDIF
				IF $haspermission:"dead"
					player.sendTitle("§c"+Integer.toString(countdown), null, 0, 30, 20)
				ENDIF
			ENDFOR
			countdown = countdown - 1
		ELSE
			IF c > 15
				c = c - 5
			ENDIF
			pool = list()
			doomEvents = $array:"Krungor":"Bopen":"Broodmother Swarm":"Super Creepers":"Ghostblades"
			FOR e = doomEvents
				IF e == "Krungor" || e == "Bopen"
					weight = 10
				ELSE
					weight = 8
				ENDIF
				IF e == lastdoom
					weight = weight / 2
				ENDIF
				FOR i2 = 0:weight
					pool.add(e)
				ENDFOR
			ENDFOR
			aPool = pool.toArray()
			Event = aPool[ $random:0:aPool.length]
			lastdoom = Event
			IF Event == "Krungor"
				boss = "KRUNGOR"
				subtitle = "The ogre king"
				bDisguise = "ZOMBIE_VILLAGER"
				bCount = 1
				othersKit = $array:"ZOMBIE_VILLAGER"
				othersDisguise = "ZOMBIE_VILLAGER"
			ELSEIF Event == "Bopen"
				boss = "BOPEN"
				subtitle = "The skeleton pirate king"
				bDisguise = "WITHER_SKELETON"
				bCount = 1
				othersKit = $array:"PIRATE"
				othersDisguise = "SKELETON"
			ELSEIF Event == "Broodmother Swarm"
				bCount = 0
				subtitle = ""
				othersKit = $array:"BROODMOTHER"
				othersDisguise = "SILVERFISH"
				livesType = "ENDERMITE"
				livesCount = 15 + $onlineplayers
			ELSEIF Event == "Super Creepers"
				bCount = 0
				subtitle = "KABOOM, but with many more O's"
				othersKit = $array:"SUPER_CREEPER"
				othersDisguise = "SUPER_CREEPER"
			ELSEIF Event == "Ghostblades"
				bCount = 0
				subtitle = ""
				othersKit = $array:"GSWORD":"GAXE":"GBOW":"GPICK":"GSWORD":"GAXE"
			ENDIF
			players = lobby.getWorld().getPlayers()
			players2 = lobby.getWorld().getPlayers()
			SYNC
				FOR player = players2
					IF $haspermission:"dwarf" || $haspermission:"monster"
						players.remove(player)
					ENDIF
				ENDFOR
			ENDSYNC
			IF players.isEmpty()
				#STOP
			ENDIF
			SYNC
				FOR player = players
					#CLEAR player
					kit = othersKit[ $random:0:othersKit.length]
					IF {"effect." + kit + ".length"} != null
						length = {"effect." + kit + ".length"}
					ELSE
						length = 0
					ENDIF
					FOR n = 0:length
						IF n%3 == 0
							effect = {"effect." + kit + "." + n}
							effect.toUpperCase()
						ELSEIF n%3 == 1
							durration = {"effect." + kit + "." + n}
							IF durration == "indef"
								durration = 1000000
							ENDIF
						ELSE
							potency = {"effect." + kit + "." + n}
							#POTION effect durration potency
						ENDIF
					ENDFOR
					#TP {"location.mobspawn"}
					IF othersDisguise != null
						#DISGUISE othersDisguise
					ENDIF
					#CMDCON "lp user $playername parent set " + kit
					#POTION "NIGHT_VISION", 200000, 1
					#POTION "DAMAGE_RESISTANCE", 200000, 2
					#POTION "HEAL", 20, 100
					#SETGAMEMODE 0
					#SCOREBOARD "TEAM" "monsters" "ADD" $playername
					#KIT player, kit
				ENDFOR
			ENDSYNC
			players = players.toArray()
			SYNC
				FOR i = 0:bCount
					#CLEAR player
					player = players[ $random:0:players.length]
					fails = 0
					IF {"effect." + boss + ".length"} != null
						length = {"effect." + boss + ".length"}
					ELSE
						length = 0
					ENDIF
					FOR n = 0:length
						IF n%3 == 0
							effect = {"effect." + boss + "." + n}
							effect.toUpperCase()
						ELSEIF n%3 == 1
							durration = {"effect." + boss + "." + n}
							IF durration == "indef"
								durration = 1000000
							ENDIF
						ELSE
							potency = {"effect." + boss + "." + n}
							#POTION effect durration potency
							#BROADCAST effect
							#BROADCAST durration
							#BROADCAST potency
						ENDIF
					ENDFOR
					fails = 0
					IF bDisguise != null
						#DISGUISE bDisguise
					ENDIF
					#CMDCON "lp user $playername parent set " + boss.toLowerCase()
					#POTION "NIGHT_VISION", 200000, 1
					#POTION "DAMAGE_RESISTANCE", 200000, 2
					#POTION "HEAL", 20, 100
					IF bEffect != null
						FOR i = 0:bEffect.length
							#CLEARPOTION bEffect[i]
							#POTION bEffect[i] 1000000 bEffectP[i]
						ENDFOR
					ENDIF
					#KIT player, boss
				ENDFOR
			ENDSYNC
			FOR player = getPlayers()
				player.sendTitle("§c"+Event, "§4"+subtitle, 40, 100, 40)
			ENDFOR
			IF livesType != null
				{"lives." + livesType} = livesCount + {"lives." + livesType}
			ENDIF
			boss = null
			bDisguise = null
			subtitle = null
			othersDisguise = null
			othersKit = null
			livesType = null
			livesCount = null
			clock.setScore(999)
		ENDIF
	ENDIF
ENDIF