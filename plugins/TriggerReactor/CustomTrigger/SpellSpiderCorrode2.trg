IMPORT org.bukkit.Material
IMPORT org.bukkit.block.BlockFace
IF event.getEntity().getType().name() == "ENDER_PEARL" && event.getEntity().getTicksLived() <= 10
  player = event.getEntity()
  p = player.getLocation()
  pX = p.getBlockX()
  pY = p.getBlockY()
  pZ = p.getBlockZ()
  world = $world
  FOR x = -2:3
   FOR y = -2:3
    FOR z = -2:3
     block = world.getBlockAt(pX + x, pY + y, pZ + z)
     u = block.getType().name()
     data = block.getBlockData()
     IF u == "STONE_BRICKS"
      r = $random:0:10
      IF r <= 3
       material = Material.MOSSY_STONE_BRICKS
      ELSE
       #CONTINUE
      ENDIF
     ELSEIF u == "CRACKED_STONE_BRICKS"
      r = $random:0:10
      IF r <= 7
       material = Material.MOSSY_STONE_BRICKS
      ELSE
       #CONTINUE
      ENDIF
     ELSEIF u == "COBBLESTONE"
       material = Material.MOSSY_COBBLESTONE
     ELSEIF u == "GRAVEL" || u == "MOSSY_STONE_BRICK_SLAB" || u == "MOSSY_STONE_BRICK_STAIRS" || u == "MOSSY_STONE_BRICK_WALL" || u == "MOSSY_STONE_BRICKS"|| u == "MOSSY_COBBLESTONE"|| block.getType().isFlammable() || u == "BRICKS" || u == "LAPIS_BLOCK" || u == "NETHER_BRICKS"
      IF $random:1:11 == 1
		block.setType(Material.SLIME_BLOCK)
	  ENDIF
      #CONTINUE
     ELSEIF u == "SMOOTH_STONE_SLAB" || u == "STONE_BRICK_SLAB"
      material = Material.MOSSY_STONE_BRICK_SLAB
      water = data.isWaterlogged()
      slab = data.getType()
     ELSEIF u == "STONE_BRICK_STAIRS"
      water = data.isWaterlogged()
      face = data.getFacing()
      half = data.getHalf()
      shape = data.getShape()
      material = Material.MOSSY_STONE_BRICK_STAIRS
     ELSEIF u == "STONE_BRICK_WALL"
      water = data.isWaterlogged()
      material = Material.MOSSY_STONE_BRICK_SLAB_WALL  
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
ENDIF