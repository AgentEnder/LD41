extends Area2D

var player
var letter = 'a'

func _ready():
	pass


func init(_letter):
	letter = _letter
	$CenterContainer/Label.text = letter

func _on_LetterTile_body_entered(body):
	if body.is_in_group("Player"):
		body.getLetter(letter)
		queue_free()