extends Node2D

@onready var theme_2_bg_music: AudioStreamPlayer2D = $Theme2_BgMusic
@onready var audio_adjust_2: Control = $Player/AudioAdjust2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	theme_2_bg_music.play()


func _on_skip_button_pressed() -> void:
	pass # Replace with function body.



func _on_area_2d_pressed() -> void:
	audio_adjust_2.show()
