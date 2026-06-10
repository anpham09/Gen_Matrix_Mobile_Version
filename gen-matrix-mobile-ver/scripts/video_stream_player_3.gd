extends VideoStreamPlayer
@onready var control: Control = $"../Control"
@onready var canvas_layer: CanvasLayer = $"../Control/CanvasLayer"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_skip_button_pressed() -> void:
	control.show()
	canvas_layer.show()
	queue_free()




func _on_finished() -> void:
	control.show()
	canvas_layer.show()
	queue_free()
