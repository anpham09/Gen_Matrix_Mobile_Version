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
	item_list.add_item("A. Surge in RAM prices due to high demand.", null, true)
	item_list.add_item("B. Higher subscription costs due to competition", null, true)
	item_list.add_item("C. Lower operating costs due to AI being able to manage itself", null, true)
	item_list.add_item("D. Fall in national minimum wage due to AI replacing human workers", null, true)
	
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_item_list_item_selected(index: int) -> void:
	
	item_list.hide()
	label.hide()
	var resultt
	if index == 0:
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
	result.text = str(resultt) + "AI demand has increased hardware needs, causing a surge in RAM prices!"




func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	#control.queue_free()



func _on_ok_button_pressed() -> void:
	control.queue_free()
