extends Node2D

var root
var player

func _ready():
	root = get_tree().get_nodes_in_group("Root")[0]
	player = get_tree().get_nodes_in_group("Player")[0]


func _on_DescendButton_pressed():
	queue_free()
	#Jank-ass bug fix. See beginning of player.gd _physics_update
	player.get_node("Coll").disabled = true
	root.BuildLevel()
	root.paused = false
	


func _on_CancelButton_pressed():
	root.paused = false
	queue_free()

func _input(event):
	if event.is_action_pressed("ui_accept") and not event.is_echo():
		_on_DescendButton_pressed()