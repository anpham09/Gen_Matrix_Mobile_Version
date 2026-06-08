extends Area2D

@onready var player: CharacterBody2D = %Player

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(body: Node2D) -> void:
	player.unlock_level_2()

func level_sound():
	animation_player.play("level")
