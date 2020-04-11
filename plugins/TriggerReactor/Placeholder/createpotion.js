var PotionEffect = Java.type("org.bukkit.potion.PotionEffect")
var PotionEffectType = Java.type("org.bukkit.potion.PotionEffectType")
var ItemStack = Java.type("org.bukkit.inventory.ItemStack")
var Material = Java.type("org.bukkit.Material")
var Color = Java.type("org.bukkit.Color")

function createpotion(args) {
	var effect = PotionEffectType.getByName(args[0])
	var duration = Math.round(args[1] * 20)
	var amplifier = args[2] - 1
	
	var potionType = Material.POTION
	if (args.length >= 4 && args[3]) {
		potionType = Material.SPLASH_POTION
	}
	
	var potion = new ItemStack(potionType, 1)
	meta = potion.getItemMeta()
	meta.addCustomEffect(new PotionEffect(effect, duration, amplifier), true)
	if (args.length == 5) {
		meta.setColor(Color[args[4]])
	}
	potion.setItemMeta(meta)
	return potion
}