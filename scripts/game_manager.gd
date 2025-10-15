extends Node

class_name game_manager

const max_fps: int = 60

func _init() -> void:
	Engine.max_fps = max_fps

	_enforce_resolution()

func _enforce_resolution() -> void:
	DisplayServer.window_set_size(Vector2i(1132, 637))
