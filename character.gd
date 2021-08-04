extends Sprite

var vel : Vector2

func movement_input():
	if Input.is_action_pressed("move_up"):
		vel.y -= 1
	if Input.is_action_pressed("move_down"):
		vel.y += 1
	if Input.is_action_pressed("move_left"):
		vel.y -= 1
	if Input.is_action_pressed("move_right"):
		vel.y -= 1
