IMPORT org.bukkit.Material
IMPORT org.bukkit.block.BlockFace
IF event.getItem() == null
 #STOP
ENDIF
IF $idname:event.getItem() == "GRAY_DYE" && getItemTitle(event.getItem()) == "Mortar"
 item = item("GRAY_DYE", 1)
 setItemTitle(item, "Mortar")
 IF takeItem(player, item, 1)
  #COOLDOWN 1
  #SOUNDALL player.getLocation(), "ENTITY_SLIME_SQUISH", 1, 0.5
  click = event.getClickedBlock()
  IF click != null
   locX = click.getX()
   locY = click.getY()
   locZ = click.getZ()   
  ELSE
   p = player.getLocation()
   locX = p.getBlockX()
   locY = p.getBlockY()
   locZ = p.getBlockZ()
  ENDIF
  world = $world
  FOR x = -2:3
   FOR y = -2:3
    FOR z = -2:3
     block = world.getBlockAt(locX + x, locY + y, locZ + z)
     u = block.getType().name()
     data = block.getBlockData()
     IF block.isEmpty()
      #CONTINUE
     ELSEIF u == "MOSSY_STONE_BRICKS" || u == "CRACKED_STONE_BRICKS" || u == "COBBLESTONE"
       material = Material.STONE_BRICKS
     ELSEIF u == "COBBLESTONE_SLAB" || u == "MOSSY_STONE_BRICK_SLAB" || u == "STONE_BRICK_SLAB"
       material = Material.SMOOTH_STONE_SLAB
       water = data.isWaterlogged()
       slab = data.getType()
     ELSEIF u == "COBBLESTONE_STAIRS" || u == "MOSSY_STONE_BRICK_STAIRS"
       face = data.getFacing()
       water = data.isWaterlogged()
       half = data.getHalf()
       shape = data.getShape()
       material = Material.STONE_BRICK_STAIRS
     ELSEIF u == "COBBLESTONE_WALL" || u == "MOSSY_STONE_BRICK_WALL"
       material = Material.STONE_BRICK_WALL
       water = data.isWaterlogged()
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
ENDIF