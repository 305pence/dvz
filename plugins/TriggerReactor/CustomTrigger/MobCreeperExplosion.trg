#COOLDOWN 0.5
IMPORT org.bukkit.Particle
IMPORT org.bukkit.Material
IMPORT org.bukkit.block.BlockFace
IF $haspermission:"creeper"
	fuse = 0.3
	radius = 3
	power = 4.0
ELSEIF $haspermission:"super_creeper"
	fuse = 0.5
	radius = 5
	power = 8.0
ELSE
	#STOP
ENDIF
IF $helditemname == "GUNPOWDER"
 #COOLDOWN 4
 #SOUNDALL player.getLocation(), "ENTITY_TNT_PRIMED", 3, 1
 pu = 2
 health = $health
 WHILE pu > 0
  #SETXP (2 - pu) / 2
  pu = pu - 0.4
  #WAIT fuse
  SYNC
  IF health > $health
   #SETXP 0
   #STOP
  ENDIF
  health = $health
  ENDSYNC
 ENDWHILE
 SYNC
  #SETHEALTH 1
  #EXPLOSION $worldname, $x, $y + 1, $z, power
  p = player.getLocation()
  pX = p.getBlockX()
  pY = p.getBlockY() + 1
  pZ = p.getBlockZ()
  world = $world
  FOR x = -1 * radius:radius + 1
   FOR y = -1 * radius:radius + 1
    FOR z = -1 * radius:radius + 1
     block = world.getBlockAt(pX + x, pY + y, pZ + z)
     u = block.getType().name()
     data = block.getBlockData()
     IF u == "STONE_BRICKS"
      r = $random:0:10
      IF r == 0
       material = Material.COBBLESTONE
      ELSEIF r <= 5 
       material = Material.CRACKED_STONE_BRICKS
      ELSE
       #CONTINUE
      ENDIF
     ELSEIF u == "CRACKED_STONE_BRICKS"
      r = $random:0:10
      IF r == 0
       material = Material.GRAVEL
      ELSEIF r <= 7
       material = Material.COBBLESTONE
      ELSE
       #CONTINUE
      ENDIF
     ELSEIF u == "COBBLESTONE"
      IF $random:0:5 >= 1
       material = Material.AIR
      ELSE
       material = Material.GRAVEL
      ENDIF
     ELSEIF u == "GRAVEL" || u == "COBBLESTONE_SLAB" || u == "COBBLESTONE_STAIRS" || u == "COBBLESTONE_WALL" || block.getType().isFlammable() || u == "BRICKS" || u == "LAPIS_BLOCK" || u == "NETHER_BRICKS"
      block.setType(Material.AIR)
      #CONTINUE
     ELSEIF u == "SMOOTH_STONE_SLAB" || u == "STONE_BRICK_SLAB" || u == "MOSSY_STONE_BRICK_SLAB"
      material = Material.COBBLESTONE_SLAB
      water = data.isWaterlogged()
      slab = data.getType()
     ELSEIF u == "STONE_BRICK_STAIRS" || u == "MOSSY_STONE_BRICK_STAIRS"
      water = data.isWaterlogged()
      face = data.getFacing()
      half = data.getHalf()
      shape = data.getShape()
      material = Material.COBBLESTONE_STAIRS
     ELSEIF u == "STONE_BRICK_WALL"
      water = data.isWaterlogged()
      material = Material.COBBLESTONE_WALL  
      faces = data.getFaces()
     ELSE
      #CONTINUE
     ENDIF
     block.setType(material)
     data = block.getBlockData()
     IF face != null
      data.setFacing(face)
      data.setHalf(half)
      data.setShape(shape)
     ENDIF
     IF slab != null
      data.setType(slab)
     ENDIF
     IF faces != null
      FOR f = faces
        data.setFace(f, true)
      ENDFOR
     ENDIF
     IF water != null
      data.setWaterlogged(water)
     ENDIF
     block.setBlockData(data)
     face = null ; slab = null ; half = null ; shape = null ; faces = null ; water = null
    ENDFOR
   ENDFOR
  ENDFOR
  world.spawnParticle(Particle.EXPLOSION_HUGE, pX, pY, pZ, 1)
 ENDSYNC
ENDIF