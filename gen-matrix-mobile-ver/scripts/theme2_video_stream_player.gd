extends VideoStreamPlayer




func _on_skip_button_pressed() -> void:
	queue_free()
	



func _on_finished() -> void:
	queue_free()
