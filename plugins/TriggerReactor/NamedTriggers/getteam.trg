//FORMAT: $getteam:{Playername/Entity} (entity or string)
IMPORT org.bukkit.Bukkit
IMPORT org.bukkit.entity.Player
IF args[0] IS Player
 return = Bukkit.getScoreboardManager().getMainScoreboard().getEntryTeam(args[0].getName())
ELSE
 id = args[0].getUniqueId().toString()
 return = Bukkit.getScoreboardManager().getMainScoreboard().getEntryTeam(id)
ENDIF