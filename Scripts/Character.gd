extends KinematicBody2D

export var speed = 30
var vel = Vector2()

onready var _animation_player = $AnimationPlayer

func _ready():
	GameManager.Player = self

func movement_input():
	if GameManager.isHot:
		vel = Vector2()
		if Input.is_action_pressed("move_up"):
			vel.y -= 1
		if Input.is_action_pressed("move_down"):
			vel.y += 1
		if Input.is_action_pressed("move_left"):
			vel.x -= 1
		if Input.is_action_pressed("move_right"):
			vel.x += 1
			
		if Input.is_action_pressed("move_left") and vel.x < 0:
			_animation_player.play("WalkLeft")
		elif Input.is_action_pressed("move_right") and vel.x > 0:
			_animation_player.play("WalkRight")
		elif Input.is_action_pressed("move_up") and vel.y < 0:
			_animation_player.play("WalkUp")
		elif Input.is_action_pressed("move_down") and vel.y > 0:
			_animation_player.play("WalkDown")
		else:
			_animation_player.stop()
	else:
		if vel.length_squared() != 0:
			return
		if Input.is_action_just_pressed("move_up"):
			vel.y = -1
		elif Input.is_action_just_pressed("move_down"):
			vel.y = 1
		elif Input.is_action_just_pressed("move_left"):
			vel.x = -1
		elif Input.is_action_just_pressed("move_right"):
			vel.x = 1
		
	vel = vel.normalized() * speed

func die():
	return null

func _physics_process(_delta):
	GameManager.switch_map_input()
	movement_input()
	vel = move_and_slide(vel)
