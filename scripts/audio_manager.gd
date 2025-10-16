extends AudioStreamPlayer

class_name audio_manager

@onready var music = preload("uid://c8hq10kcvpo50")

func _ready() -> void:
	stream = music
	stream.loop = true
	play()
