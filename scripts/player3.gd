extends CharacterBody2D



const SPEED = 150.0
const JUMP_VELOCITY = -255.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var dialog_scene = preload("res://scenes/theme_3/theme_3_question1.tscn")

@onready var dialog_scene2 = preload("res://scenes/theme_3/theme_3_question2.tscn")

@onready var dialog_scene3 = preload("res://scenes/theme_3/theme_3_question3.tscn")

@onready var dialog_scene4 = preload("res://scenes/theme_3/theme_3_question4.tscn")

@onready var dialog_scene5 = preload("res://scenes/theme_3/theme_3_question5.tscn")

@onready var dialog_scene6 = preload("res://scenes/theme_3/theme_3_question6.tscn")


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
	


var score = 0

@onready var score_label: Label = $ScoreLabel

@onready var minus_score: Label = $ScoreLabel/MinusScore



@onready var cloud: Area2D = $"../Clouds/Cloud"

@onready var cloud_2: Area2D = $"../Clouds/Cloud2"

@onready var cloud_3: Area2D = $"../Clouds/Cloud3"

@onready var cloud_4: Area2D = $"../Clouds/Cloud4"

@onready var label: Label = $"../Clouds/Cloud/Label"
@onready var labelb: Label = $"../Clouds/Cloud/Label2"

@onready var label_2: Label = $"../Clouds/Cloud2/Label3"

@onready var label_3: Label = $"../Clouds/Cloud3/Label4"

@onready var label_4: Label = $"../Clouds/Cloud4/Label5"


@onready var timer: Timer = $Timer



func add_point():
	score += 1
	score_label.text = "Fruits: " + str(score)

	
func subtract_point():
	score += -1
	score_label.text = "Fruits: " + str(score)
	
#@onready var animation_player: AnimationPlayer = $AnimationPlayer


	
func unlock_level_1():
	if score>=15:
		score += -15
		score_label.text = "Fruits: " + str(score)
		minus_score.text = "Fruits: -15"
		minus_score.show()
		label.hide()
		labelb.hide()

		timer.start()
		
		#animation_player.play("level")
		cloud.level_sound()
		
		
		#cloud.queue_free()
		
		



func unlock_level_2():
	if score>=14:
		score += -14
		score_label.text = "Fruits: " + str(score)
		minus_score.text = "Fruits: -14"
		minus_score.show()
		label_2.hide()
		timer.start()
		cloud_2.level_sound()

func unlock_level_3():
	if score>=23:
		score += -23
		score_label.text = "Fruits: " + str(score)
		minus_score.text = "Fruits: -23"
		minus_score.show()
		label_3.hide()
		timer.start()
		cloud_3.level_sound()

func unlock_level_4():
	if score>=21:
		score += -21
		score_label.text = "Fruits: " + str(score)
		minus_score.text = "Congratulations!"
		minus_score.show()
		label_4.hide()
		timer.start()
		cloud_4.level_sound()
		
		
func show_dialog1():
	var dialog = dialog_scene.instantiate()
	add_sibling(dialog)
	
func show_dialog2():
	var dialog = dialog_scene2.instantiate()
	add_sibling(dialog)
	
func show_dialog3():
	var dialog = dialog_scene3.instantiate()
	add_sibling(dialog)
	
func show_dialog4():
	var dialog = dialog_scene4.instantiate()
	add_sibling(dialog)
	
func show_dialog5():
	var dialog = dialog_scene5.instantiate()
	add_sibling(dialog)
	
func show_dialog6():
	var dialog = dialog_scene6.instantiate()
	add_sibling(dialog)

func _on_timer_timeout() -> void:
	minus_score.hide()
