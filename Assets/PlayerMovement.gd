extends Fish
@export var player_body : CharacterBody2D

var edge_of_screen := Vector2(1920,1080)
var eaten_fish = 0
var growth_per_fish = 0.01
var fish_scale = 1

func _ready():
	size = 25;
	text.text = str(size)

func _process(delta):
	turn()
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	player_body.velocity = direction * move_speed
	player_body.move_and_slide()

	position.x = clampf(position.x, 0, edge_of_screen.x)
	position.y = clampf(position.y, 0, edge_of_screen.y)
	
func grow():
	eaten_fish+=1
	size += 1
	text.text = str(size)
	fish_scale = min(fish_scale + growth_per_fish, 100)
	player_body.scale = Vector2(fish_scale, fish_scale)
	
