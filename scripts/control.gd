extends Control

@onready var control: Control = $"."
@onready var item_list_1: ItemList = $ItemList
@onready var label: Label = $Label
@onready var result_label: Label = $result
@onready var ok_button: Button = $OkButton


@onready var timer: Timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ok_button.hide()
	item_list_1.add_item("A) Use AI to write it for you.", null, true)
	item_list_1.add_item("B) Use AI to create the layout/format.", null, true)
	item_list_1.add_item("C) Use AI to revise your writing, then copy and paste what it gives.", null, true)
	item_list_1.add_item("D) Use AI to point out mistakes and help you brainstorm ideas only.", null, true)
	

#@onready var player: CharacterBody2D = %Player

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_item_list_item_selected(index: int) -> void:
	
	item_list_1.hide()
	label.hide()
	var result
	if index == 3:
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
	control.queue_free()
