extends KinematicBody2D

export var speed = 30
var vel = Vector2()
var hot = false
var switchNum = 0

func _ready():
	GameManager.Player = self

func switch_input():
	if Input.is_action_just_pressed("switch_map") and vel.length_squared() == 0:
		hot = !hot
		switchNum += 1
		if hot:
			GameManager.Water.set_collision_mask_bit(0, true)
		else:
			GameManager.Water.set_collision_mask_bit(0, false)

func movement_input():
	vel = Vector2()
	if Input.is_action_pressed("move_up"):
		vel.y -= 0.5
	if Input.is_action_pressed("move_down"):
		vel.y += 0.5
	if Input.is_action_pressed("move_left"):
		vel.x -= 0.5
	if Input.is_action_pressed("move_right"):
		vel.x += 0.5
	vel = vel.normalized() * speed
	
func slide_input():
	if vel.length_squared() != 0:
		return
	if Input.is_action_just_pressed("move_up"):
		vel.y = -0.5
	elif Input.is_action_just_pressed("move_down"):
		vel.y = 0.5
	elif Input.is_action_just_pressed("move_left"):
		vel.x = -0.5
	elif Input.is_action_just_pressed("move_right"):
		vel.x = 0.5
	vel = vel.normalized() * speed

func _physics_process(delta):
	switch_input()
	if hot:
		movement_input()
	else:
		slide_input()
	vel = move_and_slide(vel)
