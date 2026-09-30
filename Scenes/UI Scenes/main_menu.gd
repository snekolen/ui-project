extends Control


func _on_start_game_button_pressed() -> void:
	get_tree().change_scene_to_file("uid://cgmh56b8o6qff")

func _on_quit_button_pressed():
	get_tree().quit()
