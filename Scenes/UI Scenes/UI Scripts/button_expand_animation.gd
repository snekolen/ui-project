extends Button

@export var tween_time: float = 0.3
@export var scale_on_hover: Vector2 = Vector2(1.25, 1.25)

func _ready() -> void:
	offset_transform_enabled = true
	offset_transform_visual_only = false
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	
func _on_mouse_entered():
	var tween: Tween = create_tween()
	tween.set_trans(Tween.TRANS_BACK)
	tween.set_ease(Tween.EASE_IN)
	tween.tween_property(self, "offset_transform_scale", scale_on_hover, tween_time)
	
func _on_mouse_exited():
	var tween: Tween = create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "offset_transform_scale", Vector2(1, 1), tween_time)
