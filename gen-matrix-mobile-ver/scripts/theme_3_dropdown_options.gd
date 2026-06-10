extends Node2D

#@onready var audio_adjust: Control = $"../../AudioAdjust"
#@onready var audio_adjust: Control = $Player/AudioAdjust2
@onready var audio_adjust: Control = $"../../AudioAdjust2"


func _on_option_button_2_item_selected(index: int) -> void:
	var current_selected = index
	
	if current_selected == 0:
		get_tree().change_scene_to_file("res://main scenes/start_game3.tscn")
	elif current_selected == 1:
		get_tree().reload_current_scene()
	elif current_selected == 2:
		audio_adjust.show()
		#get_tree().change_scene_to_file("res://main scenes/theme3_audio_adjust.tscn")
