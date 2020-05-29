var DisguiseType = Java.type("me.libraryaddict.disguise.disguisetypes.DisguiseType")
var MobDisguise = Java.type("me.libraryaddict.disguise.disguisetypes.MobDisguise")
var MiscDisguise = Java.type("me.libraryaddict.disguise.disguisetypes.MiscDisguise")
var DisguiseAPI = Java.type("me.libraryaddict.disguise.DisguiseAPI")

function DISGUISE(args) {
	if (args.length < 1) {
		throw new Error("not enough arguments for #DISGUISE")
	}
	if (args.length > 2) {
		throw new Error("too many arguments for #DISGUISE")
	}
	if (player === null) {
		throw new Error("Player is null")
	}
	if (args.length > 1 && typeof args[1] !== "boolean") {
		throw new Error("The second argument must be a boolean")
	}
	
	var adult = args.length == 2 ? args[1] : true
	var type = DisguiseType[args[0].toUpperCase()]
	if (type === undefined) {
		throw new Error("Invalid Mob Disguise type: " + args[0])
	}
	
	var disguise
	if (type.isMob()) {
	    disguise = new MobDisguise(type, adult)
	} else {
	    disguise = new MiscDisguise(type)
	}
	DisguiseAPI.disguiseToAll(player, disguise)
}