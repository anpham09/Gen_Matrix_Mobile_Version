extends Area2D

@onready var end_game: Control = %EndGame
@onready var end_point: Area2D = $"."
@onready var final_quiz: Control = %FinalQuiz
@onready var joystick_control: Control = $"../Player/Control"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	end_point.hide()




func _on_body_entered(body: Node2D) -> void:
	joystick_control.queue_free()
	final_quiz.show()
