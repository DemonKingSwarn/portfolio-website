extends Node

class_name ui_manager

@export var books_panel: Panel
@export var pc_panel: Panel

func _books_back() -> void:
	books_panel.visible = false	
