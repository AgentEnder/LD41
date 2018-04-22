extends Node2D

var root

func _ready():
	root = get_tree().get_nodes_in_group("Root")[0]


func _on_DescendButton_pressed():
	queue_free()
	root.BuildLevel()
	root.paused = false


func _on_CancelButton_pressed():
	root.paused = false
	queue_free()

func _input(event):
	if event.is_action_pressed("ui_accept") and not event.is_echo():
		_on_DescendButton_pressed()