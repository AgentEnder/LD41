extends Node2D

var paused = false
var Room = preload("res://Scenes/Room.tscn")
var Map = []
export var Width = 5
export var Height = 5
var LevelDimens = Vector2()
var guis = {"GameOver" : preload("res://GUIs/GameOver.tscn"),
			"Descent":preload("res://GUIs/Descent.tscn"),
			"Craft" : preload("res://GUIs/Crafting.tscn")}

var words = ["sword", "shield", "health", "health"]

func _ready():
	randomize()
	LevelDimens = Vector2(Width,Height)
	get_node("Camera2D").zoom = LevelDimens
	
	BuildLevel()
	
	pass

func randBit():
	randomize()
	var random = randf()
	return round(random+.1)

func ClearLevel():
	if Map.size() > 0:
		get_node("Player").position = Map[0][0].get_node("Center").position
	for x in range(Map.size()):
		for y in range(Map[x].size()):
			Map[x][y].queue_free()
	Map.clear()

func BuildLevel():
	ClearLevel()
	for x in range(LevelDimens.x):
		Map.append([])
		for y in range(LevelDimens.y):
			Map[x].append([])
			Map[x][y] = 0
	
	for y in range(LevelDimens.y):
		for x in range(LevelDimens.x):
			AddRoom(x,y)

func AddRoom(x, y):
	if 0 <= x and x < LevelDimens.x:
		if 0 <= y and y < LevelDimens.y:
			var doors = [0,0,0,0] #URDL
			#TOP DOOR CHECKS
			if y-1 < 0:
				doors[0] = 0
			elif typeof(Map[x][y-1]) == TYPE_INT:
				doors[0] = randBit()
			elif Map[x][y-1].doors[2] == 1:
				doors[0] = 1
			else:
				doors[0] = 0
			#BOTTOM DOOR CHECKS
			if y+1 >= LevelDimens.y:
				doors[2] = 0
			elif typeof(Map[x][y+1]) == TYPE_INT:
				doors[2] = randBit()
			elif Map[x][y+1].doors[0] == 1:
				doors[2] = 1
			else:
				doors[2] = 0
			#RIGHT DOOR CHECKS
			if(x+1 >= LevelDimens.x):
				doors[1] = 0
			elif typeof(Map[x+1][y]) == TYPE_INT:
				doors[1] = randBit()
			elif Map[x+1][y].doors[3] == 1:
				doors[1] = 1
			else:
				doors[1] = 0
			#LEFT DOOR CHECKS
			if(x-1 < 0):
				doors[3] = 0
			elif typeof(Map[x-1][y]) == TYPE_INT:
				doors[3] = randBit()
			elif Map[x-1][y].doors[1] == 1:
				doors[3] = 1
			else:
				doors[3] = 0
			###ENSURE ROOM 1 HAS DOORS
			if Vector2(x,y) == Vector2():
				if doors[1] + doors[2] == 0:
					var door = randi()%2 + 1
					doors[door] = 1
			#make room
			var newRoom = Room.instance()
			newRoom.init(Vector2(x,y), doors)
			newRoom.position = Vector2(1024*x,600*y)
			Map[x][y] = newRoom
			add_child(newRoom)
			return
	else:
		raise(ValueError())
	pass

func display_gui(gui):
	$CanvasLayer.add_child(guis[gui].instance())