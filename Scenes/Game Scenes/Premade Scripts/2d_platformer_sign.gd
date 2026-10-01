extends Area2D

func _ready():
	$Panel.visible = false
	
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		_set_outline_thickness(5)
		$Panel.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		_set_outline_thickness(0)
		$Panel.visible = false

func _set_outline_thickness(thickness: float) -> void:
	var outline_material: ShaderMaterial = $CanvasGroup.material
	outline_material.set_shader_parameter("line_thickness", thickness)
