extends Node2D

@onready var theme_1_bg_music: AudioStreamPlayer2D = $Theme1_BgMusic
@onready var audio_adjust: Control = $Player/AudioAdjust


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	theme_1_bg_music.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_pressed() -> void:
	audio_adjust.show()
	


func _on_area_2d_2_pressed() -> void:
	audio_adjust.show()
	



func _on_area_2d_3_pressed() -> void:
	audio_adjust.show()
