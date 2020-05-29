//FORMAT: $getscore:{Objective}:{Player/Entity/Score} (string, entity) or (string, string)
IMPORT org.bukkit.Bukkit
IMPORT java.lang.String
IMPORT org.bukkit.entity.Player
IF args.length < 2
	#STOP
ENDIF
IF args[1] IS String
 return = Bukkit.getScoreboardManager().getMainScoreboard().getObjective(args[0]).getScore(args[1]).getScore()
ELSE
 IF args[1] IS Player
  return = Bukkit.getScoreboardManager().getMainScoreboard().getObjective(args[0]).getScore(args[1].getName()).getScore()
 ELSE
  id = args[1].getUniqueId().toString()
  return = Bukkit.getScoreboardManager().getMainScoreboard().getObjective(args[0]).getScore(id).getScore()
 ENDIF
ENDIF