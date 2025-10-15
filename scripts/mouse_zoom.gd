extends Camera3D

@export var zoom_speed = 1.0
@export var min_zoom = 2.0
@export var max_zoom = 10.0

func _input(event) -> void:
	if event.is_action_pressed("mousewheel_up"):
		translate_object_local(Vector3(0, 0, -zoom_speed))
	elif event.is_action_pressed("mousewheel_down"):
		translate_object_local(Vector3(0, 0, zoom_speed))
		
	if event is InputEventMouseButton and event.pressed:
		var mouse_pos = get_viewport().get_mouse_position()
		
		var ray_origin = project_ray_origin(mouse_pos)
		var ray_end = ray_origin + project_ray_normal(mouse_pos) * 1000
		
		var space_state = get_world_3d().direct_space_state
		var query = PhysicsRayQueryParameters3D.create(ray_origin, ray_end)
		var result = space_state.intersect_ray(query)
		
		if result:
			get_tree().change_scene_to_file("uid://dx4cy166fvgqy")
