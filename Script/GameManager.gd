extends Node

const GAME_OVER_SCENE = preload("res://Scenes/GameOverScene.tscn")

func game_over():
	var scene = GAME_OVER_SCENE.instantiate()
	add_child(scene)

func reset_game():
	get_tree().reload_current_scene()

