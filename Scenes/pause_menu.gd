extends CanvasLayer

func _ready() -> void:
	visible = false
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if get_tree().paused:
			unpause_game()
		else:
			pause_game()
			
func unpause_game():
	get_tree().paused = false
	visible = false

func pause_game():
	%ResumeButton.grab_focus()
	get_tree().paused = true
	visible = true

func quit_game():
	get_tree().quit()
