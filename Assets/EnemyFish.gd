extends Fish
class_name EnemyFish

func _process(delta):
	position += direction * move_speed

func _on_body_entered(body : Fish):
	if(body.size > size):
		print("oops player is big!")
		queue_free()
	else:
		print("I am bigger! my size is ")
		body.queue_free()
