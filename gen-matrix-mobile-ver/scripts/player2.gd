extends CharacterBody2D



const SPEED = 150.0
const JUMP_VELOCITY = -255.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

@onready var dialog_scene7 = preload("res://scenes/theme_2/theme_2_question1.tscn")

@onready var dialog_scene8 = preload("res://scenes/theme_2/theme_2_question2.tscn")

@onready var dialog_scene9 = preload("res://scenes/theme_2/theme_2_question3.tscn")

@onready var dialog_scene10 = preload("res://scenes/theme_2/theme_2_question4.tscn")

@onready var dialog_scene11 = preload("res://scenes/theme_2/theme_2_question5.tscn")

@onready var dialog_scene12 = preload("res://scenes/theme_2/theme_2_question6.tscn")

@onready var dialog_scene13 = preload("res://scenes/theme_2/theme_2_question7.tscn")

@onready var dialog_scene14 = preload("res://scenes/theme_2/theme_2_question8.tscn")

@onready var dialog_scene15 = preload("res://scenes/theme_2/theme_2_question9.tscn")

@onready var dialog_scene16 = preload("res://scenes/theme_2/theme_2_question10.tscn")





func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	
	#Flip the sprite:
	if direction > 0: 
		animated_sprite.flip_h = true
	elif direction < 0:
		animated_sprite.flip_h = false
		
	#Play animations
	if direction == 0 and is_on_floor():
		animated_sprite.play("idle")
	elif is_on_floor():
		animated_sprite.play("running")
	elif not is_on_floor():
		animated_sprite.play("jump")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

#Joystick Functions
@onready var replaced_joystick = preload("res://scenes/joystick_canvaslayer.tscn")

var joystick_instance = null

func spawn_joystick():
	if joystick_instance == null:
		joystick_instance = replaced_joystick.instantiate()
		
		add_child(joystick_instance)

func remove_joystick():
	if joystick_instance != null and is_instance_valid(joystick_instance):
		joystick_instance.queue_free()
		joystick_instance = null
		print("got here")

func _ready() -> void:
	spawn_joystick()

	

var score = 0

@onready var score_label: Label = $ScoreLabel

@onready var minus_score: Label = $ScoreLabel/MinusScore


@onready var cloud: Area2D = $"../Clouds/Cloud"

@onready var cloud_2: Area2D = $"../Clouds/Cloud2"

@onready var cloud_3: Area2D = $"../Clouds/Cloud3"

@onready var cloud_4: Area2D = $"../Clouds/Cloud4"

@onready var label: Label = $"../Clouds/Cloud/Label"

@onready var label_2: Label = $"../Clouds/Cloud2/Label2"

@onready var label_3: Label = $"../Clouds/Cloud3/Label3"

@onready var label_4: Label = $"../Clouds/Cloud4/Label4"



@onready var timer: Timer = $Timer



func add_point():
	score += 1
	score_label.text = "Plants: " + str(score)

	
func subtract_point():
	score += -1
	score_label.text = "Plants: " + str(score)
	
#@onready var animation_player: AnimationPlayer = $AnimationPlayer


	
func unlock_level_1():
	print("got into player")
	if score>=5:
		score += -5
		score_label.text = "Plants: " + str(score)
		minus_score.text = "Plants: -5"
		minus_score.show()
		label.hide()
		timer.start()
		
		#animation_player.play("level")
		cloud.level_sound()
		
		
		#cloud.queue_free()
		
		



func unlock_level_2():
	if score>=6:
		score += -6
		score_label.text = "Plants: " + str(score)
		minus_score.text = "Plants: -6"
		minus_score.show()
		label_2.hide()
		timer.start()
		cloud_2.level_sound()

func unlock_level_3():
	if score>=6:
		score += -6
		score_label.text = "Plants: " + str(score)
		minus_score.text = "Plants: -6"
		minus_score.show()
		label_3.hide()
		timer.start()
		cloud_3.level_sound()

func unlock_level_4():
	if score>=10:
		score += -10
		score_label.text = "Plants: " + str(score)
		minus_score.text = "Congratulations!"
		minus_score.show()
		label_4.hide()
		timer.start()
		cloud_4.level_sound()
		
		
#Right now, if the character has bumped into the enemy, the aboce joystick is 
#removed, so it is no longer exist for further queue free



func show_dialog7():
	remove_joystick()
	
	var dialog = dialog_scene7.instantiate()
	dialog.player = self
	add_sibling(dialog)
	
	#spawn_joystick()

func show_dialog8():
	remove_joystick()
	
	var dialog = dialog_scene8.instantiate()
	dialog.player = self
	add_sibling(dialog)
	#spawn_joystick()

	
func show_dialog9():
	remove_joystick()

	var dialog = dialog_scene9.instantiate()
	dialog.player = self
	add_sibling(dialog)
	
	#spawn_joystick()

	
func show_dialog10():
	remove_joystick()
	var dialog = dialog_scene10.instantiate()
	dialog.player = self
	add_sibling(dialog)
	
	#spawn_joystick()
	
func show_dialog11():
	remove_joystick()
	var dialog = dialog_scene11.instantiate()
	dialog.player = self
	add_sibling(dialog)
	
	#spawn_joystick()
	
func show_dialog12():
	remove_joystick()
	var dialog = dialog_scene12.instantiate()
	dialog.player = self
	add_sibling(dialog)
	
	#spawn_joystick()
	
func show_dialog13():
	remove_joystick()
	var dialog = dialog_scene13.instantiate()
	dialog.player = self
	add_sibling(dialog)
	
	#spawn_joystick()
	
func show_dialog14():
	remove_joystick()
	var dialog = dialog_scene14.instantiate()
	dialog.player = self
	add_sibling(dialog)
	
	#spawn_joystick()
	
	
func show_dialog15():
	remove_joystick()
	var dialog = dialog_scene15.instantiate()
	dialog.player = self
	add_sibling(dialog)
	
	#spawn_joystick()
	
func show_dialog16():
	remove_joystick()
	
	var dialog = dialog_scene16.instantiate()
	dialog.player = self
	add_sibling(dialog)
	#spawn_joystick()
func _on_timer_timeout() -> void:
	minus_score.hide()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main scenes/select_theme.tscn")
