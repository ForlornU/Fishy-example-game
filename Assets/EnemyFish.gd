extends Fish
class_name EnemyFish

var distance_traveled : float = 0
var distance_to_end = 1920 + 500

func init_fish():
	#Randomize fish values
	move_speed = randf_range(1, 3)
	size = randi_range(1, 99)
	text.text = str(size)
	self.scale = SizeManager.determine_size(size)
	#var fish_scale = min(size, 1)
	#self.scale = Vector2(fish_scale, fish_scale)
	turn() # Turn to face direction after spawning

func _process(delta):
	#Move across the screen
	position += direction * move_speed
	distance_traveled += direction.length() * move_speed
	if(distance_traveled > distance_to_end):
		queue_free()

func _on_body_entered(player : Fish):
	#What happens when colliding with player.
	if(not player.is_in_group("player")):
		return
		
	if(player.size > size):
		queue_free()
		player.grow()
	else:
		player.queue_free()
