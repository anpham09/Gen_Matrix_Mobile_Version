extends Area2D

@onready var player: CharacterBody2D = %Player


@onready var animation_player: AnimationPlayer = $AnimationPlayer


	



func _on_body_entered(body: Node2D) -> void:
	player.show_dialog5()
	animation_player.play("pickup")
