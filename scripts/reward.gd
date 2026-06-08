extends Area2D


#@onready var game_manager: Node = %GameManager
@onready var player: CharacterBody2D = %Player

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(body: Node2D) -> void:
	print("+1")
	player.add_point()
	#queue_free()
	animation_player.play("pickup")
	
	
