extends Control


@onready var control: Control = $"."

@onready var label: Label = $Label

@onready var result: Label = $result

@onready var item_list: ItemList = $ItemList

@onready var ok_button: Button = $OkButton


@onready var label_2: Label = $Label2


@onready var timer: Timer = $Timer

@onready var joystick_control: Control = $Player/Control

@onready var dialog_scene15 = preload("res://main scenes/joystick_after_disappear.tscn")

var player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ok_button.hide()
	item_list.add_item("A. Up to 1 million gallons", null, true)
	item_list.add_item("B. Up to 3 million gallons", null, true)
	item_list.add_item("C. Up to 5 million gallons", null, true)
	item_list.add_item("D. Up to 7 million gallons", null, true)
	

@onready var animation_player: AnimationPlayer = $AnimationPlayer



func _on_item_list_item_selected(index: int) -> void:
	
	item_list.hide()
	label.hide()
	label_2.hide()
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
	result.text = str(resultt) + "Up to 5 million gallons per day!"




func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	#control.queue_free()




func _on_ok_button_pressed() -> void:
	#var dialog = dialog_scene15.instantiate()
	#add_sibling(dialog)
	if player != null:
		player.spawn_joystick()
	control.queue_free()
