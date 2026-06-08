extends Control

@onready var end_game: Control = %EndGame2

@onready var final_quiz: Control = $"../FinalQuiz2"


func _ready() -> void:
	end_game.hide()


func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/theme_2/theme_2.tscn")


func _on_home_pressed() -> void:
	get_tree().change_scene_to_file("res://main scenes/select_theme2.tscn")


func _on_take_quiz_pressed() -> void:
	get_tree().change_scene_to_file("res://main scenes/select_theme3.tscn")
	end_game.queue_free()
