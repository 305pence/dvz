IMPORT java.lang.String
i = $helditemname
IF (i.contains("_SPAWN_EGG") || i == "IRON_PICKAXE") && $haspermission:"dead" && !($isop)
	#CANCELEVENT
	IF !({"MobRelease"}) || $getscore:"DvZ":"Doom Clock" == 0
		#MESSAGE "&cMobs are not released yet"
		#STOP
	ENDIF
	i = i.replaceAll("_SPAWN_EGG", "")
	IF i == "IRON_PICKAXE"
		i = "IRON_GOLEM"
	ENDIF
	IF {"lives." + i} != null
		IF {"lives." + i} > 0
			IF !(i == "ZOMBIE" || i == "SKELETON" || i == "CREEPER" || i == "SPIDER")
				{"lives." + i} = {"lives." + i} - 1
			ENDIF
			IF i == "IRON_GOLEM"
				#BROADCAST "&a" + $playername + " &5has become an &4" + i "&5!"
			ENDIF
			#CLEAR player
   
			//so basically here is where the effects get applied
			IF {"effect." + i + ".length"} != null
				length = {"effect." + i + ".length"}
			ELSE
				length = 0
			ENDIF
			FOR n = 0:length
				IF n%3 == 0
					effect = {"effect." + i + "." + n}
					effect.toUpperCase()
				ELSEIF n%3 == 1
					durration = {"effect." + i + "." + n}
					IF durration == "indef"
						durration = 1000000
					ENDIF
				ELSE
					potency = {"effect." + i + "." + n}
					#POTION effect durration potency
				ENDIF
			ENDFOR
   
			//here is where that part ends
   
			#CMDCON "lp user $playername parent set " + i.toLowerCase()
			#POTION "NIGHT_VISION", 200000, 1
			#POTION "DAMAGE_RESISTANCE", 200000, 2
			#POTION "HEAL", 20, 100
			#SETGAMEMODE 0
			#SCOREBOARD "TEAM" "monsters" "ADD" $playername
			#TP {"location.mobspawn"}
			#KIT player, i
			#DISGUISE i
			IF {"portal.state"}
				eye = item("ENDER_EYE", 1)
				#SETITEMNAME "&5Warp to portal", eye
				#GIVE eye
			ENDIF
		ELSE
			#MESSAGE i.toLowerCase() + " &3has already been taken"
		ENDIF
	ELSE
		#MESSAGE "&cthis mob does not seem to exist. either you got this spawn egg through means of creative or /give, or i just forgot to add a lives value to this mob"
	ENDIF
ENDIF