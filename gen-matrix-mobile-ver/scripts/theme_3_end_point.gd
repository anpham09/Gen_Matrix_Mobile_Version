extends Area2D

@onready var end_game: Control = %EndGame2

@onready var end_point: Area2D = $"."
@onready var final_quiz_2: Control = $"../Player/FinalQuiz2"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	end_point.hide()


func _on_body_entered(body: Node2D) -> void:
	final_quiz_2.show()
