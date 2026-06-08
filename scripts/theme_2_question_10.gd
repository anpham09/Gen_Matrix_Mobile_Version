extends Control


@onready var control: Control = $"."

@onready var label: Label = $Label

@onready var result: Label = $result

@onready var item_list: ItemList = $ItemList

@onready var ok_button: Button = $OkButton

@onready var label_2: Label = $Label2



@onready var timer: Timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ok_button.hide()
	item_list.add_item("A. Over 700 tons of CO2", null, true)
	item_list.add_item("B. 552 tons of CO2", null, true)
	item_list.add_item("C. 419 tons of CO2", null, true)
	item_list.add_item("D. 203 tons of CO2", null, true)
	

@onready var animation_player: AnimationPlayer = $AnimationPlayer



func _on_item_list_item_selected(index: int) -> void:
	
	item_list.hide()
	label.hide()
	label_2.hide()
	var resultt
	if index == 1:
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
	result.text = str(resultt) + "It generated about 552 tons of CO2!"




func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	#control.queue_free()



func _on_ok_button_pressed() -> void:
	control.queue_free()
