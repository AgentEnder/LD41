extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var root

func _ready():
	root = get_tree().get_nodes_in_group("Root")[0]
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Stairs_body_entered(body):
	if body.is_in_group("Player"):
		root.paused = true
		root.display_gui("Descent")
	pass # replace with function body
