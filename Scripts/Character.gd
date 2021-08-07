extends KinematicBody2D
export var speed = 30
func movement_input():
	var vel = Vector2()
	if Input.is_action_pressed("move_up"):
		vel.y -= 0.5
	if Input.is_action_pressed("move_down"):
		vel.y += 0.5
	if Input.is_action_pressed("move_left"):
		vel.x -= 0.5
	if Input.is_action_pressed("move_right"):
		vel.x += 0.5
	vel = vel.normalized() * speed
	vel = move_and_slide(vel)

func _physics_process(delta):
	movement_input()
