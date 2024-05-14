extends Fish
@export var player_body : CharacterBody2D

var edge_of_screen := Vector2(1920,1080)

func _ready():
	size = 25;
	text.text = str(size)

func _process(delta):
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	player_body.velocity = direction * move_speed
	player_body.move_and_slide()

	position.x = clampf(position.x, 0, edge_of_screen.x)
	position.y = clampf(position.y, 0, edge_of_screen.y)

