IMPORT org.bukkit.Material
IMPORT org.bukkit.block.BlockFace
IF event.getAction().name() == "LEFT_CLICK_BLOCK"
 IF $helditemname == "WOODEN_HOE" && $haspermission:"monster"
     block = event.getClickedBlock()
     u = block.getType().name()
     data = block.getBlockData()
     IF u == "STONE_BRICKS" 
      IF $random:0:15 == 0
        material = Material.CRACKED_STONE_BRICKS
        #COOLDOWN 0.2
      ELSE
        #COOLDOWN 0.2
        #CONTINUE
      ENDIF
     ELSEIF u == "CRACKED_STONE_BRICKS"
      IF $random:0:5 == 0
       material = Material.COBBLESTONE
       #COOLDOWN 0.2
      ELSE
       #COOLDOWN 0.2
       #CONTINUE
      ENDIF
     ELSEIF u == "COBBLESTONE"
      IF $random:0:3 <= 1
       material = Material.AIR
       #COOLDOWN 0.2
      ELSE
       #COOLDOWN 0.2
       #CONTINUE
      ENDIF
     ELSEIF u == "GRAVEL" || u == "COBBLESTONE_SLAB" || u == "COBBLESTONE_STAIRS" || u == "COBBLESTONE_WALL" || block.getType().isFlammable() || u == "BRICKS" || u == "LAPIS_BLOCK" || u == "NETHER_BRICKS" || u == "MOSSY_COBBLESTONE"|| u == "MOSSY_COBBLESTONE_SLAB" || u == "MOSSY_COBBLESTONE_STAIRS" || u == "MOSSY_COBBLESTONE_WALL" || u == "MOSSY_STONE_BRICK_SLAB" || u == "MOSSY_STONE_BRICK_STAIRS" || u == "MOSSY_STONE_BRICK_WALL" || u == "MOSSY_STONE_BRICKS"
      block.setType(Material.AIR)
      #SOUNDALL player.getLocation(), "ENTITY_WITHER_BREAK_BLOCK", 0.2, 1
      #COOLDOWN 0.20
      #CONTINUE
     ELSEIF u == "SMOOTH_STONE_SLAB" || u == "STONE_BRICK_SLAB" || u == "MOSSY_STONE_BRICK_SLAB"
      IF $random:0:2 == 0
       material = Material.COBBLESTONE_SLAB
       water = data.isWaterlogged()
       slab = data.getType()
       #COOLDOWN 0.2
      ELSE
       #COOLDOWN 0.2
       #CONTINUE
      ENDIF
     ELSEIF u == "STONE_BRICK_STAIRS" || u == "MOSSY_STONE_BRICK_STAIRS"
      IF $random:0:2 == 0
       water = data.isWaterlogged()
       face = data.getFacing()
       half = data.getHalf()
       shape = data.getShape()
       material = Material.COBBLESTONE_STAIRS
       #COOLDOWN 0.2
      ELSE
       #COOLDOWN 0.2
       #CONTINUE
      ENDIF
     ELSEIF u == "STONE_BRICK_WALL"
      IF $random:0:2 == 0
       water = data.isWaterlogged()
       material = Material.COBBLESTONE_WALL  
       faces = data.getFaces()
       #COOLDOWN 0.2
      ELSE
       #COOLDOWN 0.2
       #CONTINUE
      ENDIF
     ELSE
      #CONTINUE
     ENDIF
     block.setType(material)
     #SOUNDALL player.getLocation(), "ENTITY_WITHER_BREAK_BLOCK", 0.2, 1
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
 ENDIF
ENDIF
  
