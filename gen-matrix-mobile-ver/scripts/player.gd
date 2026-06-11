extends CharacterBody2D



const SPEED = 150.0
const JUMP_VELOCITY = -255.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var dialog_scene = preload("res://scenes/question.tscn")
@onready var dialog_scene2 = preload("res://scenes/question2.tscn")
@onready var dialog_scene3 = preload("res://scenes/question3.tscn")
@onready var dialog_scene4 = preload("res://scenes/question4.tscn")
@onready var dialog_scene5 = preload("res://scenes/question5.tscn")
@onready var dialog_scene6 = preload("res://scenes/question6.tscn")

@onready var dialog_scene7 = preload("res://scenes/theme_2/theme_2_question1.tscn")

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
	
func _process(delta: float) -> void:
	if Input.get_action_strength("right"):
		position.x += 100* delta


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	#if Input.get_action_strength("right"):
		#position.x += 200* delta
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
	


var score = 0

@onready var score_label: Label = $ScoreLabel

@onready var minus_score: Label = $ScoreLabel/MinusScore


@onready var cloud: Area2D = %Cloud

@onready var cloud_2: Area2D = %Cloud2

@onready var cloud_3: Area2D = %Cloud3

@onready var cloud_4: Area2D = %Cloud4

@onready var label: Label = $"../Clouds/Cloud/Label"

@onready var label_2: Label = $"../Clouds/Cloud2/Label2"

@onready var label_3: Label = $"../Clouds/Cloud3/Label2"

@onready var label_4: Label = $"../Clouds/Cloud4/Label3"



@onready var timer: Timer = $Timer



func add_point():
	score += 1
	score_label.text = "Shields: " + str(score)

	
func subtract_point():
	score += -1
	score_label.text = "Shields: " + str(score)
	
#@onready var animation_player: AnimationPlayer = $AnimationPlayer

#@onready var transform_level_point: Area2D = $"../Transform Level Point"

	
func unlock_level_1():
	if score>=6:
		score += -6
		score_label.text = "Shields: " + str(score)
		minus_score.text = "New Level Unlocked"
		minus_score.show()
		label.hide()
		timer.start()
		#transform_level_point.set_disabled(false)
		
		#animation_player.play("level")
		cloud.level_sound()
		
		
		#cloud.queue_free()
		
		



func unlock_level_2():
	if score>=6:
		score += -6
		score_label.text = "Shields: " + str(score)
		minus_score.text = "New Level Unlocked"
		minus_score.show()
		label_2.hide()
		timer.start()
		cloud_2.level_sound()

func unlock_level_3():
	if score>=8:
		score += -8
		score_label.text = "Shields: " + str(score)
		minus_score.text = "New Level Unlocked"
		minus_score.show()
		label_3.hide()
		timer.start()
		cloud_3.level_sound()

func unlock_level_4():
	if score>=14:
		score += -14
		score_label.text = "Shields: " + str(score)
		minus_score.text = "Congratulations!"
		minus_score.show()
		label_4.hide()
		timer.start()
		cloud_4.level_sound()
		
		
func show_dialog():
	remove_joystick()
	
	var dialog = dialog_scene.instantiate()
	dialog.player = self
	add_sibling(dialog)
	
func show_dialog2():
	remove_joystick()
	
	var dialog = dialog_scene2.instantiate()
	dialog.player = self
	add_sibling(dialog)

func show_dialog3():
	remove_joystick()
	
	var dialog = dialog_scene3.instantiate()
	dialog.player = self
	add_sibling(dialog)

func show_dialog4():
	remove_joystick()
	
	var dialog = dialog_scene4.instantiate()
	dialog.player = self
	add_sibling(dialog)

func show_dialog5():
	remove_joystick()
	
	var dialog = dialog_scene5.instantiate()
	dialog.player = self
	add_sibling(dialog)
	
func show_dialog6():
	remove_joystick()
	
	var dialog = dialog_scene6.instantiate()
	dialog.player = self
	add_sibling(dialog)
	
func show_dialog7():
	remove_joystick()
	
	var dialog = dialog_scene7.instantiate()
	dialog.player = self
	add_sibling(dialog)


func _on_timer_timeout() -> void:
	minus_score.hide()
