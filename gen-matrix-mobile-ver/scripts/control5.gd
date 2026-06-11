extends Control


@onready var control: Control = $"."

@onready var label: Label = $Label

@onready var result: Label = $result

@onready var item_list: ItemList = $ItemList

@onready var ok_button: Button = $OkButton




@onready var timer: Timer = $Timer

var player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ok_button.hide()
	item_list.add_item("A) Use AI to generate the entire art.", null, true)
	item_list.add_item("B) Do not give credit to AI.", null, true)
	item_list.add_item("C) Use AI art for inspiration, but not in your final piece.", null, true)
	item_list.add_item("D) Use multiple AI to try and avoid detection.", null, true)
	
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_item_list_item_selected(index: int) -> void:
	
	item_list.hide()
	label.hide()
	var resultt
	if index == 2:
		resultt = "Congratulations! You guessed it correctly!"
		animation_player.play("right_answer")
		#player.add_point()
		
		ok_button.text = "OK!"
		ok_button.show()
	else:
		resultt = "Oh no! You guessed it incorrectly!"
		animation_player.play("wrong_answer")
		
		timer.start()
		#get_tree().reload_current_scene()
	result.text = str(resultt)

		
	
	
	#timer.start()



func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	#control.queue_free()





func _on_ok_button_pressed() -> void:
	if player != null:
		player.spawn_joystick()
	control.queue_free()
