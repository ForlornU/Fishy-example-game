extends Node

const ENEMY_FISH = preload("res://Assets/EnemyFish.tscn")
var max_fish_count = 10
var spawn_rate = 1

func spawn_fish():
	var newfish = ENEMY_FISH.instantiate()
	add_child(newfish)
	init_fish(newfish)
	
func _process(delta):
	if(spawn_rate <= 0):
		spawn_fish()
		spawn_rate = 1
	else:
		spawn_rate -= delta

#TODO Take window size into account when calculating starting position
func init_fish(fish : Fish):
	var random_side = randi_range(0,2)
	var start_position : Vector2
	#randomize x
	if(random_side == 0):
		start_position.x = -200
		fish.direction = Vector2(1,0)
	else:
		start_position.x = 1920 + 200
		fish.direction = Vector2(-1,0)
		
	fish.move_speed = 2
	#randomize y
	var random_y = randf_range(62, 685)
	start_position.y = random_y
	fish.position = start_position

	
