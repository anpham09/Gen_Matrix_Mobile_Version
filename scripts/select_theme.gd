extends Control

@onready var main_bg_music: AudioStreamPlayer2D = $Main_BgMusic
@onready var color_rect: ColorRect = $ColorRect
@onready var sprite_2d_2: Sprite2D = $Sprite2D2
@onready var timer: Timer = $Timer


func _ready() -> void:
	main_bg_music.play()
	timer.start()


func _on_enter_theme_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")



func _on_enter_theme_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/theme_2/theme_2.tscn")


func _on_enter_theme_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/theme_3/theme_3.tscn")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main scenes/start_game.tscn")


func _on_timer_timeout() -> void:
	color_rect.queue_free()
