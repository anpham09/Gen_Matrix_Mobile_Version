extends Control

@onready var main_bg_music: AudioStreamPlayer2D = $Main_BgMusic


func _ready() -> void:
	main_bg_music.play()

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main scenes/start_game2.tscn")
