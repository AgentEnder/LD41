extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var menuRootPath = "../../../.."


func _on_RestartButton_pressed():
	print("PRESSED")
	get_tree().reload_current_scene()