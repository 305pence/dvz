IMPORT java.lang.String
IF args.length == 1
	IF args[0] == "help"
		#MESSAGE "this command has several usages", "&3/cm  || while holding an item, this will turn that egg into a mob, and link that mob to that egg", "&7/cm del || this will delete the mob egg that you have in your hand. this won't remove perms, nor will it remove the kit. &cdon't use this without permission from me please", "&a/cm (mob name) || this will create a custom mob, one that is not linked to any spawning item. to be used by doom events or other mobs with special kits and spawning conditions.", "&3/cm (mob name) del || this will delete a custom mob. &calso never use this one without my permission"
		#STOP
	ENDIF
	i = args[0].toUpperCase()
	IF {"lives." + i} != null
		#MESSAGE "this mob already exists"
		#STOP
	ENDIF
	i3 = i.toLowerCase()
	#CMDCON "lp creategroup " + i3
	#CMDCON "lp group " + i3 + " parent set monster"
	#CMDCON "lp group " + i3 + " permission set " + i3
	#MESSAGE "&3The custom mob &r" + i + " &3has been created. (no spawn egg)"
	{"lives." + i} = 0
	#STOP
ENDIF
IF args.length == 2
	IF args[1] == "del" && {"lives." + args[0].toUpperCase()} != null
		#CMDCON "lp deletegroup " + args[0].toLowerCase()
		{"lives." + args[0].toUpperCase()} = null
		#MESSAGE args[0] + " &3has been deleted (custom mob)"
	ELSE
		#MESSAGE "This custom mob does not exist, i think"
	ENDIF
	#STOP
ENDIF
i = $helditemname
IF i.contains("_SPAWN_EGG")
 IF args.length == 0
  args = array(1)
  args[0] = "pu"
 ENDIF
 i2 = i.replaceAll("_SPAWN_EGG", "")
 i3 = i2.toLowerCase()
 IF args[0] != "del"
  IF {"lives." + i2} != null
   #MESSAGE "&3This mob is already taken"
   #STOP 
  ENDIF
  {"lives." + i2} = 1
  #CMDCON "lp creategroup " + i3
  #CMDCON "lp group " + i3 + " parent set monster"
  #CMDCON "lp group " + i3 + " permission set " + i3
  #MESSAGE "&3The mob &r" + i2 + " &3has been created"
 ELSE
  {"lives." + i2} = null
  #MESSAGE "&3Although the kit for &r"+i2+" &3remains, the server no longer sees &r"+i2+" &3as \"existent\""
 ENDIF
ELSE
 #MESSAGE i+" does not contain _SPAWN_EGG"
ENDIF