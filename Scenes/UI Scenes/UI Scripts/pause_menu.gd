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
	
	var tween: Tween = create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_OUT)
	tween.set_parallel()
	
	tween.tween_property($Control, "modulate:a", 0, 0.3)
	tween.tween_property(%PausePanel, "offset_transform_scale", Vector2(0.8, 0.8), 0.3)
	await tween.tween_property(%PausePanel, "offset_transform_position:y", 50, 0.3).finished
	
	if get_tree().paused == false:
		visible = false
	

func pause_game():
	%ResumeButton.grab_focus()
	get_tree().paused = true
	visible = true
	
	var tween: Tween = create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_OUT)
	tween.set_parallel()
	
	tween.tween_property($Control, "modulate:a", 1, 0.3).from(0)
	tween.tween_property(%PausePanel, "offset_transform_scale", Vector2(1, 1), 0.3).from(Vector2(0.8,0.8))
	tween.tween_property(%PausePanel, "offset_transform_position:y", 0, 0.3).from(50)
	

func quit_game():
	get_tree().quit()
