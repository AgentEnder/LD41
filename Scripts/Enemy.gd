extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var player
var room
var speed = 200
var movement = Vector2()
var enabled = false

var contactDamage = 5
var health = 50
var maxHealth = 50



func _ready():
	player = get_tree().get_nodes_in_group("Player")[0]
	room = get_parent()
	pause_mode = PAUSE_MODE_STOP
	$HealthBar.max_value = maxHealth
	pass

func _physics_process(delta):
	if enabled:
		var target_pos = player.position - room.position
		movement = target_pos - position
		movement = normalize(movement)*speed
		movement = move_and_slide(movement)
		
		for node in $HitArea.get_overlapping_bodies():
			if node.is_in_group("Player"):
				node.takeDamage(contactDamage)
	pass

func takeDamage(x):
	health-=x
	$HealthBar.value = health

func normalize(vector):
	vector /= vector.length()
	return vector
