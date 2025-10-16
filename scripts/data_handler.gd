extends Node

class_name data_handler

signal list_of_games(games_dict: Dictionary)

var lang_and_tools: String = "res://data/languages_and_tools.json"
var games: String = "res://data/games.json"

var games_dict = {}

@export var langs_text: RichTextLabel
@export var tools_text: RichTextLabel

func _ready() -> void:
	_languages_and_tools()
	_games()

func _languages_and_tools() -> void:
	var file = FileAccess.open(lang_and_tools, FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		file.close()
	
		var json = JSON.new()
		var err = json.parse(json_string)

		if err == OK:
			var data = json.data

			var languages = data["languages"]
			var tools = data["tools"]

			print(languages)
			print(tools)

			var l = ", ".join(languages)
			var t = ", ".join(tools)
			langs_text.text = "Languages: %s" % [l]
			tools_text.text = "Tools: %s" % [t]

func _games() -> void:
	var file = FileAccess.open(games, FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		file.close()

		var json = JSON.new()
		var err = json.parse(json_string)

		if err == OK:
			var data = json.data

			var games_arr = data["games"]

			for game in games_arr:
				games_dict[game["name"]] = game["url"]

			emit_signal("list_of_games", games_dict)
