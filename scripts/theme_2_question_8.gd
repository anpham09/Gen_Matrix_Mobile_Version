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
	item_list.add_item("A. A website where users chat with AI", null, true)
	item_list.add_item("B. An online interface where several AI communicate", null, true)
	item_list.add_item("C. A building that stores all future plans for AI", null, true)
	item_list.add_item("D. A facility that runs technology and trains AI.", null, true)
	

@onready var animation_player: AnimationPlayer = $AnimationPlayer



func _on_item_list_item_selected(index: int) -> void:
	
	item_list.hide()
	label.hide()
	var resultt
	if index == 3:
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
	result.text = str(resultt) + "It is a facility that runs and trains AI!"




func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	#control.queue_free()



func _on_ok_button_pressed() -> void:
	control.queue_free()
