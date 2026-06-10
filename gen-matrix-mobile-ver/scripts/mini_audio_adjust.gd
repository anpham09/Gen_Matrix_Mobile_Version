extends Control

@onready var audio_adjust: Control = $"."




func _ready() -> void:
	audio_adjust.hide()

	



func _on_back_button_2_pressed() -> void:
	audio_adjust.hide()
