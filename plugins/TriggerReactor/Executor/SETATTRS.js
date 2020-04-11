var AttributeModifier = Java.type("org.bukkit.attribute.AttributeModifier")
var Attribute = Java.type("org.bukkit.attribute.Attribute")
var Operation = Java.type("org.bukkit.attribute.AttributeModifier.Operation")
var EquipmentSlot = Java.type("org.bukkit.inventory.EquipmentSlot")
var UUID = Java.type("java.util.UUID")

function SETATTRS(args) {
	var item = args[0]
	var meta = item.getItemMeta()
	meta.setAttributeModifiers(null)
	for (var i = 1; i <= (args.length - 1) / 3; i++) {
		var base = (i - 1) * 3 + 1
		var attr = Attribute.valueOf(args[base])
		var amount = args[base + 1]
		var slot = EquipmentSlot.valueOf(args[base + 2])
		
	    meta.addAttributeModifier(attr, new AttributeModifier(UUID.randomUUID(), "yeet", amount, Operation.ADD_NUMBER, slot))
	}
	item.setItemMeta(meta)
}