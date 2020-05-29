// usage: #KIT player, mob kit
player = args[0]
name = args[1]
	FOR ii = 0:36
		IF ii <= 3 && {"kit."+name+".armor."+ii} != null
			slot = {"kit."+name+".armor."+ii}
			#SETPLAYERINV ii + 36, slot.clone()
		ENDIF
		IF {"kit."+name+".inv."+ii} != null
			slot = {"kit."+name+".inv."+ii}
			IF $emptyslots > 0
				#GIVE slot.clone()
			ELSE
				#DROPITEM slot.clone(), player.getLocation()
			ENDIF
		ENDIF
	ENDFOR