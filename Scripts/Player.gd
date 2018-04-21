extends KinematicBody2D

const BASEDMG = 20
const SCOREPATH = "CanvasLayer/Container/VBoxContainer/CenterContainer/Label"

var GameOver = preload("res://Scenes/GameOver.tscn")

var motion = Vector2()
var moveSpeed = 400

var cameras = [0,0]
var currentCameraIdx = 0

var health = 100
var maxHealth = 100
var score = -15
var inventory = []
var damage = BASEDMG
var dead = false

func _ready():
	cameras = [get_parent().get_node("Camera"),get_parent().get_node("Camera2D")]
	$HealthBar.max_value = maxHealth
	damage = BASEDMG
	pass

func _physics_process(delta):
	if not dead:
		#Toggle Cameras
		if(Input.is_action_just_pressed("ui_view_map")):
			cameras[currentCameraIdx].current = false
			currentCameraIdx = (currentCameraIdx+1)%2
			cameras[currentCameraIdx].current = true
		#Reset (With All Children Nodes Cleared)
		elif(Input.is_action_just_pressed("ui_cancel")):
			for child in get_parent().get_children():
				child.queue_free()
			get_tree().reload_current_scene()
		#Movement Input
		if(Input.is_action_pressed("ui_up")):
			motion.y = -1
		elif(Input.is_action_pressed("ui_down")):
			motion.y = 1
		else:
			motion.y = 0
			
		if(Input.is_action_pressed("ui_left")):
			motion.x = -1
		elif(Input.is_action_pressed("ui_right")):
			motion.x = 1
		else:
			motion.x = 0
		#Normalize Movement
		if not motion.is_normalized():
			motion = motion.normalized()
		
		if Input.is_action_just_pressed("player_attack"):
			for body in $HitArea.get_overlapping_bodies():
				if body.is_in_group("Enemy"):
					body.takeDamage(damage)
		
		motion*=moveSpeed
		#Movement
		move_and_slide(motion)

func addScore(x):
	score += x
	var string = "Score: " + str(score)
	get_parent().get_node(SCOREPATH).text = string
	
func takeDamage(x): 
	health -= x
	if health <= 0:
		die()
	$HealthBar.value = health
	
func die():
	get_tree().get_nodes_in_group("GUI")[0].add_child(GameOver.instance())
	dead = true