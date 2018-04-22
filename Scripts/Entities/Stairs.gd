extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var root
var player
var timer = 0
var enabled = false

func _ready():
	root = get_tree().get_nodes_in_group("Root")[0]
	player = get_tree().get_nodes_in_group("Player")[0]
	pass

func _process(delta):
	timer+=delta
	if timer > 5:
		enabled = true
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Stairs_body_entered(body):
	if body.is_in_group("Player"):
		root.paused = true
		root.display_gui("Descent")
