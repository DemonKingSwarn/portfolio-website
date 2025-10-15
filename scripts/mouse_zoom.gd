extends Camera3D

@export var zoom_speed = 1.0
@export var min_zoom = 2.0
@export var max_zoom = 10.0

func _input(event) -> void:
	if event.is_action_pressed("mousewheel_up"):
		translate_object_local(Vector3(0, 0, -zoom_speed))
	elif event.is_action_pressed("mousewheel_down"):
		translate_object_local(Vector3(0, 0, zoom_speed))
