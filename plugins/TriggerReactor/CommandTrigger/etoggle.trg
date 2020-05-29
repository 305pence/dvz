IF $haspermission:"essentials.*"
	#CMDCON "lp user $playername permission unset essentials.*"
ELSE
	#CMDCON "lp user $playername permission set essentials.*"
ENDIF