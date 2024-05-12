extends Fish
@export var player_body : CharacterBody2D

func _ready():
	size = 5;

func _process(delta):
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	player_body.velocity = direction * move_speed
	player_body.move_and_slide()

