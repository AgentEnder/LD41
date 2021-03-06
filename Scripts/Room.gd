extends Node2D

var doors = [0,0,0,0] #Bitmask for doors, URDL (Clockwise)
var wall_scns = [preload("res://MiniScenes/Walls/HWall.tscn"),preload("res://MiniScenes/Walls/VWall.tscn")]
var wallPositions = Vector2(512,308)

var door_scns = [preload("res://MiniScenes/Walls/HorizDoor.tscn"), preload("res://MiniScenes/Walls/VertDoor.tscn")]
var doorPositions = Vector2(960,544)

var bounds = [0,0,1024,608]
var mapPos = Vector2()
var enemy_scn = preload("res://MiniScenes/Enemy.tscn")

var pickups = []
var stairs_scn = preload("res://MiniScenes/Stairs.tscn")

func _ready():
	var dir = Directory.new()
	dir.open("res://MiniScenes/Pickups")
	dir.list_dir_begin()
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			pickups.append(load(file))
	dir.list_dir_end()
	pass

func _process(delta):
	for body in $Door.get_overlapping_bodies():
		if body.is_in_group("Player"):
			get_tree().get_nodes_in_group("Camera")[0].position = get_node("Center").global_position

func init(arg_mapPos, arg_doors):
	doors = arg_doors
	mapPos = arg_mapPos
	buildWalls()
	if not mapPos == Vector2():
		spawnItems()

func buildWalls():
	for i in range(len(doors)):
		if i == 0:
			var instance
			if(doors[i] == 1):
				instance = door_scns[0].instance()
			elif(doors[i] == 0):
				instance = wall_scns[0].instance()
			add_child(instance)
		elif i == 1:
			var instance
			if(doors[i] == 1):
				instance = door_scns[1].instance()
			elif(doors[i] == 0):
				instance = wall_scns[1].instance()
			instance.position = Vector2(bounds[2]-64, 0)
			add_child(instance)
		elif i == 2:
			var instance
			if(doors[i] == 1):
				instance = door_scns[0].instance()
			elif(doors[i] == 0):
				instance = wall_scns[0].instance()
			instance.position = Vector2(bounds[0],bounds[3]-64) 
			add_child(instance)
		elif i == 3:
			var instance
			if(doors[i] == 1):
				instance = door_scns[1].instance()
			elif(doors[i] == 0):
				instance = wall_scns[1].instance()
			add_child(instance)

func spawnItems():
	if doors[0]+doors[1]+doors[2]+doors[3] == 1:
		var stair = stairs_scn.instance()
		stair.position = $Center.position
		add_child(stair)
	for spawnPoint in $SpawnPoints.get_children():
		var roll = randf()
		if roll > 0.75:
			var node = enemy_scn.instance()
			node.position = spawnPoint.position
			add_child(node)

func move_to():
	get_tree().get_root().get_node("Camera")
