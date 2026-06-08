extends Control

@onready var end_game: Control = $"."

@onready var final_quiz: Control = $"../FinalQuiz2"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	end_game.hide()



func _on_take_quiz_pressed() -> void:
	#final_quiz.please_show()
	get_tree().change_scene_to_file("res://main scenes/select_theme3.tscn")
	end_game.queue_free()
	#get_tree().change_scene_to_file("res://scenes/final_quiz.tscn")


func _on_home_pressed() -> void:
	get_tree().change_scene_to_file("res://main scenes/select_theme3.tscn")


func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/theme_3/theme_3.tscn")
