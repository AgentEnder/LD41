extends KinematicBody2D

const BASEDMG = 20
const SCOREPATH = "CanvasLayer/Container/VSplitContainer/CenterContainer/Label"
const INVENTORYPATH = "CanvasLayer/Container/VSplitContainer/Container/Label"

var HitSamples = [preload("res://Sounds/Player/Hit1.wav"),preload("res://Sounds/Player/Hit2.wav")]

var root

var motion = Vector2()
var moveSpeed = 400

var cameras = [0,0]
var currentCameraIdx = 0

var health = 100
var maxHealth = 100
var score = -15
var inventory = ""
var damage = BASEDMG
var dead = false
var defense = 0

var collTimer = 0

func _ready():
	cameras = [get_parent().get_node("Camera"),get_parent().get_node("Camera2D")]
	$HealthBar.max_value = maxHealth
	damage = BASEDMG
	root = get_parent()
	$Shield.visible = false
	$Sword.visible = false
	$Helmet.visible = false
	updateInventory()
	pass

func _physics_process(delta):
	#JankyAss bug fix. Collisions disabled when level rebuilt
	#to prevent tp issues. Re-enabled soon after so that game works.
	if collTimer > 0.125 and $Coll.disabled == true:
		$Coll.disabled = false
		collTimer = 0
	elif $Coll.disabled:
		collTimer += delta
	if not dead and not root.paused: #Player can interact
		#Toggle Cameras
		if(Input.is_action_just_pressed("ui_view_map")):
			cameras[currentCameraIdx].current = false
			currentCameraIdx = (currentCameraIdx+1)%2
			cameras[currentCameraIdx].current = true
		#Reset (With All Children Nodes Cleared)
		elif(Input.is_action_just_pressed("ui_cancel")):
			for child in get_parent().get_children():
				child.queue_free()
			get_tree().change_scene("res://GUIs/MainMenu.tscn")
		elif(Input.is_action_just_pressed("ui_craft")):
			root.paused = true
			root.display_gui("Craft")
		#Movement Input
		if(Input.is_action_pressed("ui_up")):
			motion.y = -1
			$Sprite.animation = "bwalk"
		elif(Input.is_action_pressed("ui_down")):
			motion.y = 1
			$Sprite.animation = "fwalk"
		else:
			motion.y = 0
			
		if(Input.is_action_pressed("ui_left")):
			motion.x = -1
			$Sprite.animation = "fwalk"
		elif(Input.is_action_pressed("ui_right")):
			motion.x = 1
			$Sprite.animation = "fwalk"
		else:
			motion.x = 0
		#Normalize Movement
		if not motion.is_normalized():
			motion = motion.normalized()
		
		if motion.length() < 1: #Player idle
			$Sprite.playing = false
			$Sprite.frame = 0
		else: #Player moving
			$Sprite.playing = true
		
		if Input.is_action_just_pressed("player_attack"):
			for body in $HitArea.get_overlapping_bodies():
				if body.is_in_group("Enemy"):
					body.takeDamage(damage)
		
		motion*=moveSpeed #Motion with length = speed
		if $Sprite.animation == "bwalk":
			$Shield.z_index = -1
			$Sword.z_index = -1
		else:
			$Shield.z_index = 1
			$Sword.z_index = 1
		#Movement
		move_and_slide(motion)

func addScore(x):
	score += x
	var string = "Score: " + str(score)
	get_parent().get_node(SCOREPATH).text = string #Update Score
	
func takeDamage(x): 
	health -= (100-defense)*x/100 #take X dmg in proportion to defense
	if not $Shield/Anim.is_playing(): #Shield block
		$Shield/Anim.play("block")
	if health <= 0:
		die()
	$HealthBar.value = health #Update Healthbar
	#If AudioStream is playing
	if $AudioStreamPlayer2D.stream.get_length() > $AudioStreamPlayer2D.get_playback_position():
		return #Dont play new sound
	#Choose new sound and play.
	$AudioStreamPlayer2D.stream = HitSamples[randi()%HitSamples.size()]
	$AudioStreamPlayer2D.playing = true

func die():
	root.display_gui("GameOver")
	dead = true
	
func getLetter(letter):
	inventory += letter
	updateInventory()

func updateInventory():
	root.get_node(INVENTORYPATH).text = inventory

func checkWord(word):
	#Get letter:count for each letter in word
	var letters = {}
	for c in word: #
		if c in letters.keys():
			letters[c] += 1
		else:
			letters[c] = 1
	#Get letter:count for each letter in inventory
	var invLetters = {}
	for c in inventory:
		if c in invLetters.keys():
			invLetters[c] += 1
		else:
			invLetters[c] = 1
	#Compare two dicts to ensure that each key in letters{}
	#is also in inventory. Ensure that inventory has at least count for each key.
	var hasWord = true
	for key in letters.keys():
		if key in invLetters.keys():
			if letters[key] > invLetters[key]:
				hasWord = false
		else:
			hasWord = false
	return hasWord
	
func useLettersFromInventory(string):
	#Do craft effects
	if string == "health":
		health = maxHealth
		$HealthBar.value = health
	elif string == "shield":
		defense+=5
		$Shield.visible = true
	elif string == "helmet":
		defense+=10
		$Helmet.visible = true
	elif string == "sword":
		damage+=10
		$Sword.visible = true
	#Remove chars.
	for c in string: #For each char
		for i in range(inventory.length()):
			#Remove first matching char by adding [0,i) and (i,0]
			if inventory[i] == c:
				inventory = inventory.substr(0,i) + inventory.substr(i+1,inventory.length()-i-1)
				break;
	updateInventory()