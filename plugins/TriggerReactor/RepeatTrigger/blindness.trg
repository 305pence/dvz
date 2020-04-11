IMPORT org.bukkit.potion.PotionEffectType
SYNC
 FOR player = getPlayers()
  IF trigger == "repeat" && {"MobRelease"}
    world = $world
    IF world.getBlockAt(player.getLocation()).getLightLevel() <= 4 && !($helditemname == "TORCH" || $idname:$offhanditem == "TORCH") && !($haseffect:"LUCK" || $haseffect:"NIGHT_VISION") && $haspermission:"dwarf" && !($haspermission:"hero")
     #POTION "BLINDNESS" 2000
    ELSE
     #CLEARPOTION "BLINDNESS"
    ENDIF
  ENDIF
 ENDFOR
ENDSYNC