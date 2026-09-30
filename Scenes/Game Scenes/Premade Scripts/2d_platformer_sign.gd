extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		_set_outline_thickness(5)

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		_set_outline_thickness(0)

func _set_outline_thickness(thickness: float) -> void:
	var outline_material: ShaderMaterial = $CanvasGroup.material
	outline_material.set_shader_parameter("line_thickness", thickness)
