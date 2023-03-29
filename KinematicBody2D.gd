extends KinematicBody2D

# _input 
#v promene kam player jde a jakou rychlosti
#physics proces move and slide

const speed = 150

var last_motion = Vector2()

func _physics_process(delta):
	var input = Vector2() 
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input = input.normalized()
	move_and_slide(input * speed)
	
	if input.y:
		if input.y < 0:
			$AnimatedSprite.play("walk_up")
		else:
			$AnimatedSprite.play("walk_down")
	elif input.x:
		if input.x > 0:
			$AnimatedSprite.play("walk_right")
		else:
			$AnimatedSprite.play("walk_left")
	elif last_motion.y:
		if last_motion.y < 0:
			$AnimatedSprite.play("stand_up")
		else:
			$AnimatedSprite.play("stand_down")
	elif last_motion.x:
		if last_motion.x > 0:
			$AnimatedSprite.play("stand_right")
		else:
			$AnimatedSprite.play("stand_left")
	
	last_motion = input
