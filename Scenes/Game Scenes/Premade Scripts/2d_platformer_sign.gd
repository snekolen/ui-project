extends Area2D

func _ready():
	$Panel.modulate.a = 0
	
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		_set_outline_thickness(5)
		$Panel.visible = true
		
		var tween: Tween = create_tween()
		tween.set_trans(Tween.TRANS_CUBIC)
		tween.set_ease(Tween.EASE_OUT)
		tween.set_parallel()
		
		tween.tween_property($Panel, "modulate:a", 1, 0.3).from(0)
		tween.tween_property($Panel, "offset_transform_position:y", 0, 0.3).from(50)
	

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		_set_outline_thickness(0)
		
		var tween: Tween = create_tween()
		tween.set_trans(Tween.TRANS_CUBIC)
		tween.set_ease(Tween.EASE_OUT)
		tween.set_parallel()
		
		tween.tween_property($Panel, "modulate:a", 0, 0.3)
		await tween.tween_property($Panel, "offset_transform_position:y", 50, 0.3).finished
	

func _set_outline_thickness(thickness: float) -> void:
	var outline_material: ShaderMaterial = $CanvasGroup.material
	outline_material.set_shader_parameter("line_thickness", thickness)
