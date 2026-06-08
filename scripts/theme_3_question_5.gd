extends Control


@onready var control: Control = $"."

@onready var label: Label = $Label

@onready var result: Label = $result

@onready var item_list: ItemList = $ItemList

@onready var ok_button: Button = $OkButton




@onready var timer: Timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ok_button.hide()
	item_list.add_item("A. Yes, because AI can fully comprehend human emotions and provide the same emotional connection as a real person", null, true)
	item_list.add_item("B. Yes, because AI can give better advice than the average human", null, true)
	item_list.add_item("C. No, because AI lacks empathy and understanding, as it can only recite words it has seen from similar conversations", null, true)
	item_list.add_item("D. No, because AI cannot properly mimic human tones or voices", null, true)
	
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_item_list_item_selected(index: int) -> void:
	
	item_list.hide()
	label.hide()
	var resultt
	if index == 2:
		resultt = "Congratulations! "
		animation_player.play("right_answer")
		#player.add_point()
		
		ok_button.text = "OK!"
		ok_button.show()
	else:
		resultt = "Oh no! "
		animation_player.play("wrong_answer")
		
		timer.start()
		#get_tree().reload_current_scene()
	result.text = str(resultt) + "AI should not replace human conversation because it lacks empathy and real understanding!"




func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	#control.queue_free()



func _on_ok_button_pressed() -> void:
	control.queue_free()
