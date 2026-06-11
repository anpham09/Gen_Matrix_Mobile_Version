extends Control



@onready var control: Control = $"."
@onready var item_list_1: ItemList = $ItemList
@onready var label: Label = $Label
@onready var result_label: Label = $result

@onready var ok_button: Button = $OkButton


@onready var timer: Timer = $Timer

var player



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ok_button.hide()
	item_list_1.add_item("A) Time email was sent and sender profile picture.", null, true)
	item_list_1.add_item("B) Spelling mistakes, inconsistent writing format, and the name/organization of the sender.", null, true)
	item_list_1.add_item("C) Text size and text color.", null, true)
	item_list_1.add_item("D) Date email was sent and sender signature.", null, true)
	
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_item_list_item_selected(index: int) -> void:
	
	item_list_1.hide()
	label.hide()
	var result
	if index == 1:
		result = "Congratulations! You guessed it correctly!"
		animation_player.play("right_answer")
		#player.add_point()
		
		ok_button.text = "OK!"
		ok_button.show()
	else:
		result = "Oh no! You guessed it incorrectly!"
		animation_player.play("wrong_answer")
		
		timer.start()
		#get_tree().reload_current_scene()
	result_label.text = str(result)

		
	
	
	#timer.start()



func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	#control.queue_free()






func _on_ok_button_pressed() -> void:
	if player != null:
		player.spawn_joystick()
	control.queue_free()
