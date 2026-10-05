extends Control

func _ready() -> void:
	%StartGameButton.grab_focus(true)

func _on_start_game_button_pressed() -> void:
	get_tree().change_scene_to_file("uid://dcxt7rtgcxcac")

func _on_quit_button_pressed():
	get_tree().quit()
