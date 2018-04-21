extends Node2D

var doors = [0,0,0,0] #Bitmask for doors, URDL (Clockwise)
var wall = preload("res://MiniScenes/Walls/Wall.tscn")
var wallScale = Vector2(16,9.5)
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
	
func init(arg_mapPos, arg_doors):
	doors = arg_doors
	mapPos = arg_mapPos
	buildWalls()
	if not mapPos == Vector2():
		spawnItems()

func buildWalls():
	for i in range(len(doors)):
		if i == 0:
			if(doors[i] == 1):
				var door_instance = door_scns[0].instance()
				add_child(door_instance)
			elif(doors[i] == 0):
				var wall_instance = wall.instance()
				wall_instance.scale = Vector2(wallScale.x, 1)
				wall_instance.position = Vector2(bounds[2]/2, bounds[1]+32)
				add_child(wall_instance)
		elif i == 1:
			if(doors[i] == 1):
				var door_instance = door_scns[1].instance()
				door_instance.position = Vector2(bounds[2]-64, 0)
				add_child(door_instance)
			elif(doors[i] == 0):
				var wall_instance = wall.instance()
				wall_instance.scale = Vector2(1, wallScale.y)
				wall_instance.position = Vector2(bounds[2]-32, bounds[3]/2)
				add_child(wall_instance)
		elif i == 2:
			if(doors[i] == 1):
				var door_instance = door_scns[0].instance()
				door_instance.position = Vector2(bounds[0],bounds[3]-64) 
				add_child(door_instance)
			elif(doors[i] == 0):
				var wall_instance = wall.instance()
				wall_instance.scale = Vector2(wallScale.x, 1)
				wall_instance.position = Vector2(bounds[2]/2, bounds[3]-32)
				add_child(wall_instance)
		elif i == 3:
			if(doors[i] == 1):
				var door_instance = door_scns[1].instance()
				add_child(door_instance)
			elif(doors[i] == 0):
				var wall_instance = wall.instance()
				wall_instance.scale = Vector2(1, wallScale.y)
				wall_instance.position = Vector2(bounds[0]+32, bounds[3]/2)
				add_child(wall_instance)

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
