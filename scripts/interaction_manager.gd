extends Node

class_name interaction_manager

@export var books_panel: Panel
@export var pc_panel: Panel

func _interaacted(interacted_obj: String) -> void:
	if interacted_obj == "books":
		books_panel.visible = true

	elif interacted_obj == "PC":
		pc_panel.visible = true
