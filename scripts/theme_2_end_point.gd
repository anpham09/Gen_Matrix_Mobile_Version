extends Area2D

@onready var end_game: Control = %EndGame2
@onready var final_quiz_2: Control = $"../Player/FinalQuiz2"
@onready var end_point: Area2D = $"."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	end_point.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	
	final_quiz_2.show()
