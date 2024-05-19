extends Node
const ENEMY_FISH = preload("res://Scenes/Enemy/EnemyFish.tscn")
const PLAYER_FISH = preload("res://Scenes/Player/Player.tscn")
@export var max_fish_count = 10
@export var spawn_rate := float(1)
var spawn_timer = 0

func _ready():
	spawn_player()
	
func spawn_player():
	var player_fish = PLAYER_FISH.instantiate()
	add_child(player_fish)
	player_fish.position = Vector2(960, 540) # Centre of screen
	player_fish.player_died.connect(disable_spawning)

func spawn_fish():
	var newfish = ENEMY_FISH.instantiate()
	add_child(newfish)
	init_fish(newfish)
	var player = get_tree().get_first_node_in_group("player") as Fish
	newfish.init_fish(player.size)
	
func _process(delta):
	#Spawn a fish every x seconds
	if(spawn_timer <= 0 and get_tree().get_nodes_in_group("enemy_fish").size() < max_fish_count):
		spawn_fish()
		spawn_timer = spawn_rate
	else:
		spawn_timer -= delta

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
	
	#randomize y
	var random_y = randf_range(20, 1060) #20 pixel margin
	start_position.y = random_y
	fish.position = start_position

func disable_spawning():
	set_process(false)
