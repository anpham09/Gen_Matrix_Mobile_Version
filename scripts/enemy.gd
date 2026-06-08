extends Area2D

@onready var player: CharacterBody2D = %Player

#@onready var dialog_scene = preload("res://scenes/question.tscn")



#func show_dialog():
	#var dialog = dialog_scene.instantiate()
	#add_sibling(dialog)
	

#func _on_body_entered(body: Node2D) -> void:
	#show_dialog()


@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(body: Node2D) -> void:
	player.show_dialog()
	#queue_free()
	animation_player.play("pickup")
