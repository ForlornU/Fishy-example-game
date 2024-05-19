extends Node

const max_player_size = 200
const  min_fish_size = float(0.25)
const max_fish_size = float(5)

func determine_size(fish_size : int) -> Vector2:
	var new_size = lerpf(min_fish_size, max_fish_size, float(fish_size)/100)
	return Vector2(new_size,new_size)
