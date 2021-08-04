extends KinematicBody2D

var vel = Vector2()
var speed = 30
func movement_input():
	if Input.is_action_pressed("move_up"):
		vel.y -= 0.5
	if Input.is_action_pressed("move_down"):
		vel.y += 0.5
	if Input.is_action_pressed("move_left"):
		vel.y -= 0.5
	if Input.is_action_pressed("move_right"):
		vel.y -= 0.5
	vel = vel.normalized() * speed

func _physics_process(delta):
	vel = move_and_slide(vel)
