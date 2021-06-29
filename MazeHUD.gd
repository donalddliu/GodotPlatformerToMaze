extends CanvasLayer

var numberOfCoins = 0


func _ready():
	$NumberOfCoins.text = String(numberOfCoins)

func _on_coin_collected():
	numberOfCoins = numberOfCoins + 1
	_ready()	# Updates the number of coins collected in HUD
	
	# If player picks up two coins, go to win scene
	if numberOfCoins == 2:
		get_tree().change_scene("res://WinScene.tscn")
	
