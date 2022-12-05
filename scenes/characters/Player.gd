extends KinematicBody2D

var SPEED = 200
var velocity = Vector2()

func _ready():
	pass # Replace with function body.

func move(direction):
	if direction.x < 0:
		$Sprite.flip_h = true
	elif direction.x > 0:
		$Sprite.flip_h = false
	
	velocity = direction * 200
	velocity = move_and_slide(velocity)
