extends Control


func _on_button_pressed():
	GameManager.reset_game()
	queue_free()
