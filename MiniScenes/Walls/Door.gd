extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var player
var entered = false
var roomEntryBonus = 15

func _ready():
	player = get_tree().get_nodes_in_group("Player")[0]
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_Door_body_entered(body):
	if(body == player):
		var room = get_parent()
		#Add Score
		if not entered:
			player.addScore(roomEntryBonus)
			room.get_node("Cover").queue_free()
			entered = true

		for node in room.get_children():
			if node.is_in_group("Enemy"):
				node.enabled = true
		get_tree().get_nodes_in_group("Camera")[0].position = room.get_node("Center").global_position

func _on_Door_body_exited( body ):
	if body == player:
		var room = get_parent()
		for node in room.get_children():
			if node.is_in_group("Enemy"):
				node.enabled = false
