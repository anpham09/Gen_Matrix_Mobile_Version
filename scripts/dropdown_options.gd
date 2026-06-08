extends Node2D
@onready var dropdown_options: Node2D = $"."

@onready var audio_adjust: Control = $"../AudioAdjust"


func _on_option_button_2_item_selected(index: int) -> void:
	var current_selected = index
	
	if current_selected == 0:
		get_tree().change_scene_to_file("res://main scenes/start_gamesub.tscn")
	elif current_selected == 1:
		#get_tree().reload_current_scene()
		get_tree().change_scene_to_file("res://scenes/game.tscn")
	elif current_selected == 2:
		#get_tree().change_scene_to_file("res://main scenes/theme1_audio_adjust.tscn")
		audio_adjust.show()
		
