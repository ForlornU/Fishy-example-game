extends Node2D
class_name Fish

var starting_position : Vector2
var size : int
@export var move_speed = 100.0
var direction : Vector2
@export var text : Label
@export var sprite : Sprite2D

func turn():
	if(direction.x < 0):
		sprite.flip_h = false
	elif(direction.x > 0):
		sprite.flip_h = true

