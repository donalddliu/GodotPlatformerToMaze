extends Area2D


# Creates a signal so coin functionality can be connected to the game's HUD
signal coin_collected

func _on_Coin_body_entered(body):
	if (body.get_name() == "Player"):
		queue_free() # Deletes coin from game when a body enters it
		emit_signal("coin_collected") # Sends a signal to the game HUD
		set_collision_mask_bit(0, 1) # Makes sure a player can only collect each coin once

