clicked = event.clickedEntity
IF $getteam:clicked == $getteam:player && clicked.getType().name() == "PLAYER" && event.getHand().name() == "HAND"
	IF player.getPassengers().size() > 0 && $helditemname == "SADDLE"
		passenger = player.getPassengers().toArray()
		IF passenger[0] == clicked
			player.eject()
			vector = player.getLocation().getDirection().multiply(0.75)
			clicked.setVelocity(vector)
		ELSE
			#MESSAGE "&cThis person is not riding you"
		ENDIF
	ELSEIF clicked.hasPermission("skeleton_horse") && clicked.getPassengers().size() == 0 && $helditemname != "SADDLE"
		clicked.addPassenger(player)
		#COOLDOWN 1
	ENDIF
ENDIF
