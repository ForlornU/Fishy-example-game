extends Fish

var player_body #: CharacterBody2D
var edge_of_screen := Vector2(1920,1080)
var growth_per_fish = 0.01
var fish_scale = 1

func _ready():
	player_body = self
	size = 5;
	text.text = str(size)
	self.scale = SizeManager.determine_size(size)

func _process(delta):
	turn()
	#Player movement and clamping position within window
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	player_body.velocity = direction * move_speed
	player_body.move_and_slide()
	position.x = clampf(position.x, 0, edge_of_screen.x)
	position.y = clampf(position.y, 0, edge_of_screen.y)
	
func grow():
	#Grow when eating an enemy-fish
	size += 1
	text.text = str(size)
	var new_scale = SizeManager.determine_size(size)
	#Animate grow effect
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(new_scale.x + 0.1, new_scale.y + 0.1), 0.4)
	tween.tween_property(self, "scale", new_scale, 0.4)

