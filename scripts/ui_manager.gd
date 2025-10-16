extends Node

class_name ui_manager

@export_category("Panels")
@export var books_panel: Panel
@export var pc_panel: Panel

@export_category("Games Button")
@export var game1: Button
@export var game2: Button
@export var game3: Button

func _books_back() -> void:
	books_panel.visible = false	

func _pc_back()  -> void:
	pc_panel.visible = false

func _get_games(games: Dictionary) -> void:
	game1.set_text("SuperPacker")
	game1.pressed.connect(_game1.bind(games["SuperPacker"]))

	game2.set_text("Spike Hopper")
	game1.pressed.connect(_game2.bind(games["Spike Hopper"]))

	game3.set_text("PongExtreme")
	game3.pressed.connect(_game3.bind(games["PongExtreme"]))

func _game1(games_url: String) -> void:
	OS.shell_open(games_url)

func _game2(games_url: String) -> void:
	OS.shell_open(games_url)

func _game3(games_url: String) -> void:
	OS.shell_open(games_url)
