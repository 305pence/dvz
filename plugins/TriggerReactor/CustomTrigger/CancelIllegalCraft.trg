recipe = event.getRecipe()
r = recipe.getResult().getType().name()
IF r == "LAPIS_LAZULI" || r == "GOLD_BLOCK" || r == "ENCHANTING_TABLE" || r == "DIAMOND_SWORD"
 #CANCELEVENT
 #MESSAGE "&cthe power of canceling the crafting event compels you"
ENDIF
