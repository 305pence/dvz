IMPORT org.bukkit.Bukkit
IMPORT java.lang.String
IF args.length == 2
	player = Bukkit.getPlayer(args[1])
ENDIF
IF args.length > 0
	i = args[0].toUpperCase()
	IF {"lives." + i} == null
		#MESSAGE "&cmob doesn't exist"
		#STOP
	ENDIF
	#CLEAR player
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
	#CMDCON "lp user $playername parent set " + i.toLowerCase()
	#POTION "NIGHT_VISION", 200000, 1
	#POTION "DAMAGE_RESISTANCE", 200000, 2
	#POTION "HEAL", 20, 100
	#SETGAMEMODE 0
	#SCOREBOARD "TEAM" "monsters" "ADD" $playername
	#TP {"location.mobspawn"}
	#KIT player, i
	IF {"portal.state"}
		eye = item("ENDER_EYE", 1)
		#SETITEMNAME "&5Warp to portal", eye
		#GIVE eye
	ENDIF
ELSE
	#MESSAGE "Usage: /mob (mob name) (player name)"
ENDIF