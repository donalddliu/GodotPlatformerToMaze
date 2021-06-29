extends KinematicBody2D


var velocity = Vector2(0,0)
const SPEED = 180
const GRAVITY = 35	# Gravity force
const JUMPFORCE = -1000	# Jump force is negative because y-axis is inverted
const UP_DIRECTION = Vector2.UP


func _physics_process(delta):	# Runs 60 times per second
	if Input.is_action_pressed("right"):
		velocity.x = SPEED	# Move right
		$Sprite.play("walk")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED # Move left
		$Sprite.play("walk")
		$Sprite.flip_h = true
	else:	# No key is pressed, so don't move
		$Sprite.play("idle")
	
	# When player is in the air, play jump animation
	if not is_on_floor():
		$Sprite.play("jump")
		
	# Adds gravity to the player's y velocity
	velocity.y = velocity.y + GRAVITY
	
	# If the player is on the floor and up arrow was pressed, jump up
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMPFORCE
	
	# Actually moves your character once you set the velocities
	velocity = move_and_slide(velocity, UP_DIRECTION)
	
	# Add linear interpolation so player gradually slows down
	velocity.x = lerp(velocity.x,0,0.5)


# If player falls into fall zone, go to gameover scene
func _on_Fall_Zone_body_entered(body):
	get_tree().change_scene("res://GameOver.tscn")
