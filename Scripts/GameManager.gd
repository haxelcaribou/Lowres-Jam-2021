extends Node

var Player
var Water

var switchNum = 0
var isHot = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func switch_map_input():
	if Input.is_action_just_pressed("switch_map") and Player.vel.length_squared() == 0:
		isHot = !isHot
		switchNum += 1
		if isHot:
			Water.set_collision_mask_bit(0, true)
		else:
			Water.set_collision_mask_bit(0, false)
