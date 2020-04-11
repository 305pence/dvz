IF entity.getType().name() == "WITHER"
 IMPORT org.bukkit.inventory.ItemFlag
 IMPORT org.bukkit.Bukkit
 players = $onlineplayers
 dwarves = 0.0
 FOR player = getPlayers()      //counting the dwarves
  IF $haspermission:"dwarf"
   dwarves = dwarves + 1
  ENDIF
 ENDFOR

 m = Bukkit.getScoreboardManager()
 highestDamage = 1
 FOR player = getPlayers()
  IF $haspermission:"dwarf"
   score = m.getMainScoreboard().getObjective("witherDamage").getScore($playername).getScore()
   IF score > highestDamage
    highestDamage = score
    ww = player
   ENDIF
  ENDIF
 ENDFOR
 IF ww != null
  player = ww
  #BROADCAST "&3" + $playername + " &5has dealt &3" + highestDamage + " &5damage to the Wither and has become the &6Wither Warrior"
  #CMDCON "lp user $playername parent set witherwarrior"
  eye = item("ENDER_EYE", 1)
  meta = eye.getItemMeta()
  meta.addItemFlags(ItemFlag.HIDE_ENCHANTS)
  eye.setItemMeta(meta)
  #ENCHANT eye, "VANISHING_CURSE", 1
  #SETITEMNAME "&6Eye of the Wither", eye
  #SETITEMLORE "&6Hero Item\nContains the gear of the Wither Warrior", eye
  IF $emptyslot == -1 || $emptyslot >= 36
   #SETPLAYERINV 8, eye
   #MESSAGE "&3Your inventory was full, so an item was replaced to make room"
  ELSE
   #GIVE eye
  ENDIF
 ENDIF

 IF dwarves/players >= 2/3   //comparing the dwarves to player ratio to determine whether an assassin event is nessessary or not
  #CALL "Assassin"
 ELSE
  {"MobRelease"} = true
  #BROADCAST "&5#========================#"
  #BROADCAST "&5The Mobs Have Been Released"
  #BROADCAST "&5#========================#"
 ENDIF
ENDIF


