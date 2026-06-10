extends Control

@onready var DisplayText: Label = $VBoxContainer/DisplayText
@onready var ListItem: ItemList = $VBoxContainer/ItemList
@onready var OkButton: Button = $VBoxContainer/Button
@onready var end_game_2: Control = %EndGame2

@onready var final_quiz: Control = $"."

#@onready var timer: Timer = $Timer




var items : Array = [
	{
		"question": "How does AI use up water?",
		"options": ["Water is used to cool and maintain AI systems", "People managing AI need to drink water", "AI systems drink water", "Water is used to spray AI grid gardens"],
		"correctoptionIndex": 0
	},
	{
		"question": "In 2023, how much water did Google report using across all data centers? (lincolninst.edu/publications/land-lines-magazine/articles/land-water-impacts-data-centers/)",
		"options": ["About 12 billion gallons", "About 1 billion gallons", "Over 5 billion gallons", "Over 10 billion gallons"],
		"correctoptionIndex": 2
	},
	{
		"question": "How much water does a large sized data center use daily? (lincolninst.edu/publications/land-lines-magazine/articles/land-water-impacts-data-centers/)",
		"options": ["Up to 1 million gallons", "Up to 5 million gallons", "Up to 3 million gallons", "Up to 7 million gallons"],
		"correctoptionIndex": 1
	},
	{
		"question": "What is an AI data center?",
		"options": ["A website where users chat with AI", "A facility that runs technology and trains AI", "An online interface where several AI communicate", "A building storing future AI plans"],
		"correctoptionIndex": 1
	},
	{
		"question": "In 2023, what percent of global greenhouse gas emissions did data centers produce? (news.climate.columbia.edu/2023/06/09/ais-growing-carbon-footprint/)",
		"options": ["About 5%", "About 10%", "About 3%", "About 8.5%"],
		"correctoptionIndex": 2
	},
	{
		"question": "Meta's planned hyperscale AI data center in Wyoming will use as much electricity as how many homes? (lincolninst.edu/publications/land-lines-magazine/articles/land-water-impacts-data-centers/)",
		"options": ["More than all the homes in Wyoming combined", "10,000 homes", "50,000 homes", "100,000 homes"],
		"correctoptionIndex": 0
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
		greet = "CongratulationS"
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
