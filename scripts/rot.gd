extends Node3D

@export var rot_time: float
@export var cam: Camera3D

var is_rotating := false
var last_mouse_pos := Vector2.ZERO

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				is_rotating = true
				last_mouse_pos = event.position
			else:
				is_rotating = false

func _process(delta) -> void:
	if is_rotating:
		var mouse_pos = get_viewport().get_mouse_position()
		var mouse_delta = mouse_pos - last_mouse_pos

		rotation.y += mouse_delta.x * 0.01

		last_mouse_pos = mouse_pos
	
	else:
		pass
