extends StaticBody3D

func _ready() -> void:
	input_ray_pickable = true
	input_event.connect(_on_input_event)

func _on_input_event(camera, event, position, normal, shape_idx) -> void:
	if event is InputEventMouseButton and event.pressed:
		print("Object clicked!")
