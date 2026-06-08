extends Control

@onready var DisplayText: Label = $VBoxContainer/DisplayText
@onready var ListItem: ItemList = $VBoxContainer/ItemList
@onready var OkButton: Button = $VBoxContainer/Button
@onready var end_game_2: Control = %EndGame2

@onready var final_quiz: Control = $"."

@onready var timer: Timer = $Timer




var items : Array = [
	{
		"question": "Can artificial intelligence think or understand things?",
		"options": [
			"Yes, because AI has its own independent consciousness",
			"No, because AI generated responses are based on pattern recognition and not original concepts",
			"No, because AI generated responses are based on humans typing answers in real time",
			"Yes, because AI can think, feel, and wonder the same way humans do"
		],
		"correctoptionIndex": 1,
		"explanation": "AI cannot think or understand. It only recognizes patterns from training data."
	},
	{
		"question": "Why do AI generated images sometimes look strange or nonsensical?",
		"options": [
			"Because AI uses more imagination than the average human",
			"Because AI is trained from hundreds of existing photos, creating inconsistencies",
			"Because AI art is intended to be recognizable",
			"Because AI cannot see or use reference images"
		],
		"correctoptionIndex": 1,
		"explanation": "AI images can look strange because they combine patterns from many existing images."
	},
	{
		"question": "What is deepfake and why can it be dangerous?",
		"options": [
			"An AI generated response used to prove people wrong",
			"An AI generated animation of robots doing dangerous tasks",
			"An AI generated response using fake information to trick users",
			"An AI generated photo, voice, or video that can realistically fake people or events"
		],
		"correctoptionIndex": 3,
		"explanation": "A deepfake is a very realistic AI generated image, voice, or video that can fake events or people."
	},
	{
		"question": "Which of the following is an AI driven economic impact in the United States?",
		"options": [
			"Higher subscription costs due to competition",
			"Surge in RAM prices due to high demand",
			"Lower operating costs because AI manages itself",
			"Fall in minimum wage because AI replaced workers"
		],
		"correctoptionIndex": 1,
		"explanation": "High AI demand has increased hardware needs, causing RAM prices to surge."
	},
	{
		"question": "Should artificial intelligence replace talking to a real human?",
		"options": [
			"Yes, because AI fully understands human emotions",
			"Yes, because AI gives better advice than humans",
			"No, because AI lacks empathy and real understanding",
			"No, because AI cannot mimic human voices"
		],
		"correctoptionIndex": 2,
		"explanation": "AI should not replace human conversation because it lacks empathy and understanding."
	},
	{
		"question": "What is AI sycophancy?",
		"options": [
			"AI databases syncing to generate responses",
			"AI mixing accurate and inaccurate information",
			"The idea AI will automate all jobs",
			"The tendency for AI to agree with users instead of prioritizing accuracy"
		],
		"correctoptionIndex": 3,
		"explanation": "AI sycophancy means AI tends to agree with users instead of prioritizing accuracy."
	}
]
var item : Dictionary
var index_item : int = 0

var correct : float = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	OkButton.hide()
	refresh_scene()

func refresh_scene():
	
	if index_item >= items.size():
		show_result()
	else:
		show_question()

func show_result():
	ListItem.hide()
	var score = round(correct / items.size() * 100)
	var greet
	if score >= 60:
		greet = "Congratulations"
	else: 
		greet = "Oh no"
	OkButton.show()
	DisplayText.text = "{greet} ! Your score is {score}".format({"greet":greet, "score":score})

func show_question():

	ListItem.show()

	ListItem.clear()
	item = items[index_item]
	DisplayText.text = item.question
	var options = item.options
	for option in options:
		ListItem.add_item(option)


func _on_item_list_item_selected(index: int) -> void:
	if index == item.correctoptionIndex:
		correct += 1
	index_item += 1
	refresh_scene()
	



func _on_button_pressed() -> void:
	#final_quiz.hide()
	end_game_2.show()
	queue_free()
	
