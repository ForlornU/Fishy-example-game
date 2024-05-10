extends Node
var move_speed = 1000
@export var player_body : CharacterBody2D

func _ready():
	pass # Replace with function body.

func _process(delta):
	var input = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	player_body.velocity = input * move_speed
	player_body.move_and_slide()
