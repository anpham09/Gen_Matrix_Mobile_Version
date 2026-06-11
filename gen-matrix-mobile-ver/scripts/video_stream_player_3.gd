extends VideoStreamPlayer
@onready var player: CharacterBody2D = %Player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#player.spawn_joystick()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_skip_button_pressed() -> void:
	queue_free()




func _on_finished() -> void:
	queue_free()
