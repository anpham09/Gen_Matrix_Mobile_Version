extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var player: CharacterBody2D = %Player

func _on_body_entered(body: Node2D) -> void:
	print("+1")
	player.add_point()
	#queue_free()
	animation_player.play("pickup")
