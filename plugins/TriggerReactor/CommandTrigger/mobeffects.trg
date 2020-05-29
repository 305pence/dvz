IMPORT org.bukkit.potion.PotionEffectType
IMPORT java.lang.String
IMPORT java.lang.Integer
IF args.length == 1
	IF args[0] == "help"
		#MESSAGE "&7here's a list of bukkit potion effect names: (some may not make sense)"
		FOR potion = PotionEffectType.values()
			#MESSAGE "&3" + potion.getName()
		ENDFOR
		#STOP
	ENDIF
ENDIF
IF args.length == 2
	IF args[1] == "clear"
		FOR i = 0:101
			{"effect." + args[0].toUpperCase() + "." + i} = null
		ENDFOR
		#MESSAGE "all effects for "+ args[0].toUpperCase() + " cleared"
		#STOP
	ENDIF
ENDIF
IF args.length < 4
	#MESSAGE "&3Usage: /mobeffects (mob name) (potion type name) (durration in ticks) (potency)"
	#MESSAGE "&btry \"/mobeffects help\" for a list of potion effects"
	#MESSAGE "&cUse \"/mobeffects (mob name) clear\" to clear all potion effects"
	#MESSAGE "&2If you want the effect to last forever, replace durration with &aindef&2."
	#STOP
ENDIF
name = args[0].toUpperCase()
IF {"lives." + name} == null
	#MESSAGE "&3This mob does not exist, sorry"
	#STOP
ENDIF
IF (args.length - 1)%3 != 0
	#MESSAGE "&cyou did something wrong, specifically each effect is not given a potency or durration"
	#STOP
ENDIF
FOR i = 0:101
	{"effect." + name + "." + i} = null
ENDFOR
SYNC
	FOR i = 0:(args.length - 1)
		IF i%3 != 0
			IF i%3 == 1 && args[i + 1] == "indef"
				{"effect." + name + "." + i} = args[i + 1]
				#CONTINUE
			ENDIF
			effect = Integer.parseInt(args[i + 1])
		ELSE
			effect = args[i + 1]
			IF PotionEffectType.getByName(effect) == null
				#MESSAGE "&cunchanged because " + effect + " is not a valid potion effect! (use /mobeffects help)"
				#STOP
			ENDIF
		ENDIF
		{"effect." + name + "." + i} = effect 
		effect = null
	ENDFOR
ENDSYNC
#MESSAGE "&3Successfully given &7"+ name +"&3:"
FOR i = 0:(args.length - 1)
	IF i%3 == 0
		effect = args[i + 1]
	ELSEIF i%3 == 1
		durration = args[i + 1]
	ELSE
		potency = args[i + 1]
		#MESSAGE effect + " &3for &7" + durration + " &3with a potency of &7" + potency
	ENDIF
ENDFOR
{"effect." + name + ".length"} = args.length - 1
	
	
	
	
	
	
	
	
	
	