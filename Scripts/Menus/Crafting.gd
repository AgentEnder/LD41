extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var MainContainer
var root
var player

func _ready():
	root = get_tree().get_nodes_in_group("Root")[0]
	root.paused = true
	player = get_tree().get_nodes_in_group("Player")[0]
	MainContainer = get_node("Container/VBoxContainer")
	var font = load("res://Fonts/font.tres")
	#Generate Crafting Buttons
	for word in root.words:
		var row = CenterContainer.new()
		var cols = HBoxContainer.new()
		var button = Button.new()
		button.connect("pressed", self, "wordClick", [word, button])
		button.text = word
		button.add_font_override("font", font)
		cols.add_child(button)
		row.add_child(cols)
		MainContainer.add_child(row)
		
func wordClick(word, button):
	if player.checkWord(word):
		player.useLettersFromInventory(word)
	root.paused = false
	queue_free()

func _on_CancelButton_pressed():
	root.paused = false
	queue_free() # replace with function body
