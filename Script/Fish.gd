extends Node2D
class_name Fish
#Base class for all fish, player and enemy

var starting_position : Vector2
var size : int
@export var move_speed = 100.0
var direction : Vector2
@export var text : Label
@export var sprite : Sprite2D

func turn():
	#Turn based on our current direction, look left or right
	if(direction.x < 0):
		sprite.flip_h = false
	elif(direction.x > 0):
		sprite.flip_h = true

