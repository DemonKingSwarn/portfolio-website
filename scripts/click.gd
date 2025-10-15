extends Node3D

signal interacted(interacted_obj: String)

@export var cam: Camera3D

@export var change_scene: bool

func _input(event) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var mouse_pos = get_viewport().get_mouse_position()
		
		var ray_origin = cam.project_ray_origin(mouse_pos)
		var ray_end = ray_origin + cam.project_ray_normal(mouse_pos) * 1000
		
		var space_state = get_world_3d().direct_space_state
		var query = PhysicsRayQueryParameters3D.create(ray_origin, ray_end)
		var result = space_state.intersect_ray(query)
		
		if result:
			var collider = result["collider"]
			if change_scene:
				get_tree().change_scene_to_file("uid://dx4cy166fvgqy")
			else:
				if collider.is_in_group("books"):
					print("interacted with books")
					emit_signal("interacted", "books")
				elif collider.is_in_group("PC"):
					print("interacted with PC")
					emit_signal("interacted", "PC")
