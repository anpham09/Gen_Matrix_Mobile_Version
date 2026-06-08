extends Control

@onready var end_game: Control = %EndGame

@onready var final_quiz: Control = %FinalQuiz



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	end_game.hide()

	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass






func _on_take_quiz_pressed() -> void:
	#final_quiz.please_show()
	get_tree().change_scene_to_file("res://main scenes/select_theme2.tscn")
	end_game.queue_free()
	#get_tree().change_scene_to_file("res://scenes/final_quiz.tscn")
	


func _on_home_pressed() -> void:
	get_tree().change_scene_to_file("res://main scenes/start_game.tscn")


func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
