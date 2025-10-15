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

		"""
		var cam_forward = -cam.global_transform.basis.z.normalized()
		var plane = Plane(cam_forward, global_transform.origin)

		var from = cam.project_ray_origin(mouse_pos)
		var to = from + cam.project_ray_normal(mouse_pos) * 1000
		var intersect = plane.intersects_ray(from, to)
		if intersect != null:
			var direction = (intersect - global_transform.origin).normalized()
			var target_pitch = -asin(direction.dot(cam.global_transform.basis.y))
			rotation.x = clamp(target_pitch, deg_to_rad(-80), deg_to_rad(80))
		"""
		
		last_mouse_pos = mouse_pos
	
	else:
		pass
