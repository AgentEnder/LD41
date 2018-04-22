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

func _on_Door_body_exited( body ):
	if body == player:
		var room = get_parent()
		for node in room.get_children():
			if node.is_in_group("Enemy"):
				node.enabled = false
