//USAGE: #LASER {user location} {target location} {particle type} {thickness} {range} {return entities}| (location, location, string, float, int)
//if no or null range is given, it goes until it reaches the target location.
//if no thickness is given, 0 is assumed. if return entities is unset, false is assumed
//the number of particles used is 25 times the area of a sphere created using thickness as the radius. probably not right but it works good enough
IMPORT org.bukkit.Particle
IMPORT org.bukkit.util.Vector
IMPORT java.lang.Math
IF args.length < 6
 damage = false
ELSE
 damage = args[5]
ENDIF
IF args.length < 5
 r = null
ELSE
 r = args[4]
ENDIF
IF args.length < 4
 thicc = 0.0
ELSE
 thicc = toFloat(args[3])
ENDIF
dthicc = 0.25 + thicc * 2
p = Particle.valueOf(args[2])
world = args[0].getWorld()
locT = args[1].clone()
locU = args[0].clone()

IF thicc == 0
 dis = 0
 count = 1
ELSE
 IF thicc > 1
  thicc = 1
 ENDIF 
 dis = thicc
 count = toInt(25 * (4 * Math.PI * Math.pow(thicc, 2.0)))
ENDIF

vec = locT.subtract(args[0]).toVector().normalize().multiply(0.25)

IF r != null 
 displacement = vec.clone()
 displacement.multiply(4 * r)
 locU2 = args[0].clone()
 displaced = locU2.add(displacement)
 IF displaced.distanceSquared(args[0]) < args[1].distanceSquared(args[0])
  args[1] = displaced
 ENDIF
ENDIF
IF damage
 hit = set()
ENDIF
WHILE locU.distanceSquared(args[0]) <= args[1].distanceSquared(args[0])
 world.spawnParticle(p, locU, count, dis, dis, dis, 0.0, null)
 IF hit != null
  hit.addAll(world.getNearbyEntities(locU, dthicc, dthicc, dthicc))
 ENDIF
 locU.add(vec)
ENDWHILE
IF hit != null
 return = hit
ENDIF