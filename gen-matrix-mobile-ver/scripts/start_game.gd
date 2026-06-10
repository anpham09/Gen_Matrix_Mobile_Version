extends Control

@onready var main_bg_music: AudioStreamPlayer2D = $Main_BgMusic

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_bg_music.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_game_pressed() -> void:
	get_tree().change_scene_to_file("res://main scenes/select_theme.tscn")


func _on_credit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main scenes/credit_page (2).tscn")


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://main scenes/audio_adjust.tscn")
