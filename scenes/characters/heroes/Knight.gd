extends "res://scenes/characters/Player.gd"

var slash : PackedScene = preload("res://scenes/attacks/Slash.tscn")

func _ready():
	pass # Replace with function body.

func attack(dir):
	if dir.x < 0:
		$Sprite.flip_h = true
	elif dir.x > 0:
		$Sprite.flip_h = false
	
	var s = slash.instance()
	add_child(s)
	var ang = dir.angle_to(Vector2(0,1))
	s.rotation = -ang
	s.position = dir*35
	
