extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for btn: Button in %GridContainer.get_children():
		btn.pressed.connect(_on_level_button_pressed)
		
func _on_level_button_pressed():
	get_tree().change_scene_to_file("uid://cgmh56b8o6qff")
