DisguiseAPI = Java.type("me.libraryaddict.disguise.DisguiseAPI")

function UNDISGUISE(args) {
	if (args.length > 0) {
		throw new Error("too many arguments for #UNDISGUISE")
	}
	if (player === null) {
		throw new Error("Player is null")
	}
	
	DisguiseAPI.undisguiseToAll(player)
}