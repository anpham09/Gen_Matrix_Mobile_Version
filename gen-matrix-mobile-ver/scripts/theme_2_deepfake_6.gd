extends Area2D

@onready var player: CharacterBody2D = %Player

@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var control: Control = $"../../Player/Control"

	



func _on_body_entered(body: Node2D) -> void:
	control.hide()
	player.show_dialog12()
	animation_player.play("pickup")
