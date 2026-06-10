extends Control

@onready var DisplayText: Label = $VBoxContainer/DisplayText
@onready var ListItem: ItemList = $VBoxContainer/ItemList
@onready var OkButton: Button = $VBoxContainer/Button

@onready var final_quiz: Control = $"."
@onready var end_game: Control = %EndGame

@onready var timer: Timer = $Timer




var items : Array = [
	{
		"question": "If you have to write an essay for school, how can you use AI??",
		"options": ["Use AI to write it for you.", "Use AI to create the layout/format.", "Use AI to revise your writing, then copy and paste what it gives.", "Use AI to point out mistakes and help you brainstorm ideas only."],
		"correctoptionIndex": 3
	},
	{
		"question": "You receive an email from a trustworthy organization that says your bank account has expired, what should you do??",
		"options": ["Click on the link to see what happens!", "Check for spelling mistakes in their email, and never click on the link.", "Reply to the email and ask for details.", "Enter your username, password to log in."],
		"correctoptionIndex": 1
	},
{
		"question": "If you receive an email or text from an unknown source, what are the main things you should look for to check if it is a scam??",
		"options": ["Spelling mistakes, inconsistent writing format, and the name/organization of the sender.", "Time email was sent and sender profile picture.", "Text size and text color.", "Date email was sent and sender signature."],
		"correctoptionIndex": 0
	},
{
		"question": "Which of these is NOT personal information you should never give out to an unknown sender or website??",
		"options": ["Your name.", "Your date of birth.", "Your address.", "All of these should never be given out."],
		"correctoptionIndex": 3
	},
{
		"question": "If you used AI to help you research for a school project, what should you do to avoid plagiarism??",
		"options": ["Keep it a secret so you don't get caught.", "Use AI to help you do the whole project.", "Ask your teacher beforehand if it is allowed, then cite that you used AI in your project.", "Use multiple AI to try and avoid detection."],
		"correctoptionIndex": 2
	},
{
		"question": "What should you do if you want to use AI-generated art to create something??",
		"options": ["Use AI art for inspiration or practicing drawing, but not in your final piece.", "Use AI to generate the entire art.", "Do not give credit to AI.", "Use multiple AI to try and avoid detection."],
		"correctoptionIndex": 0
	},
{
		"question": "How can you use AI for a research project??",
		"options": ["Use AI to summarize texts or books in order to avoid reading them.", "Use AI to check for writing mistakes and explore ideas.", " Copy and paste just a little from AI-generated essays.", " Use AI to rewrite your sentences if you have incorrect spelling or grammar."],
		"correctoptionIndex": 1
	},
	{
	"question": "T/F: It is okay to participate in the Q&A activity by Instagram, where anonymous users ask you personal questions and you share the answers publicly through story",
	"options": ["True", "False"],
	"correctoptionIndex": 1
  },
  {
	"question": "T/F: Using AI to help you with an assignment is the same as using AI to do your assignment.",
	"options": ["True", "False"],
	"correctoptionIndex": 1
  },
  {
	"question": "T/F: Generative AI takes answers or pictures from the internet, then reorganizes them in order to answer your prompts",
	"options": ["True", "False"],
	"correctoptionIndex": 0
  },
  {
	"question": "What does \"The Chinese Room\" by John Searle say about AI?",
	"options": [
	  "AI has no understanding, it mimics the reaction from previous ideas.",
	  "AI can create entirely new forms and images on its own.",
	  "Chinese AI uses different programming than AI in the West.",
      "AI has its own mind and can act the same as a human."
	],
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
	end_game.show()
	queue_free()
	
