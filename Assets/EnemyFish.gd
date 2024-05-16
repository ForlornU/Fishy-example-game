extends Fish
class_name EnemyFish

var distance_traveled : float = 0
var distance_to_end = 1920 + 500

func _process(delta):
	#Move across the screen
	turn() #NOTE Does not need to turn every frame
	position += direction * move_speed
	distance_traveled += direction.length() * move_speed
	if(distance_traveled > distance_to_end):
		queue_free()

func _on_body_entered(player : Fish):
	#What happens when colliding with player. NOTE Any collider works atm
	if(player.size > size):
		queue_free()
		player.grow()
	else:
		player.queue_free()
