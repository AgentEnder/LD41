extends KinematicBody2D

var player
var room
var root
var speed = 200
var movement = Vector2()
var enabled = false

var contactDamage = 15
var health = 50
var maxHealth = 50
var letters = []

var scoreBonus = 30

var letterTiles = preload("res://MiniScenes/LetterTile.tscn")

var HitSamples = []

func _ready():
	player = get_tree().get_nodes_in_group("Player")[0]
	root = get_tree().get_nodes_in_group("Root")[0]
	room = get_parent()
	contactDamage *= root.Level
	HitSamples =[load("res://Sounds/Enemy/Hit1.wav"), load("res://Sounds/Enemy/Hit2.wav")]
	
	for word in root.words:
		for c in word:
			if not c in letters:
				letters.append(c)
	pause_mode = PAUSE_MODE_STOP
	$HealthBar.max_value = maxHealth
	pass

func _physics_process(dt):
	if enabled and not root.paused:
		var target_pos = player.position - room.position
		movement = target_pos - position
		movement = normalize(movement)*speed
		movement = move_and_slide(movement)
		
		for node in $HitArea.get_overlapping_bodies():
			if node == player:
				node.takeDamage(contactDamage*dt)
	pass

func takeDamage(x):
	$AudioStreamPlayer2D.stream = HitSamples[randi()%HitSamples.size()]
	$AudioStreamPlayer2D.playing = true
	health-=x
	if health <= 0:
		die()
	$HealthBar.value = health

func die():
	player.addScore(scoreBonus)
	var tile = letterTiles.instance()
	tile.init(letters[randi()%letters.size()])
	tile.position = position
	room.add_child(tile)
	queue_free()

func normalize(vector):
	vector /= vector.length()
	return vector
