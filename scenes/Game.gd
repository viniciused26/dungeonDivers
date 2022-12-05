extends Node2D

func _ready():
	$GUI/Joystick.connect("touch_released", self, "_on_Touch_Released")

func _on_Touch_Released(d):
	$Knight.attack(d)

func _process(delta):
	if $GUI/Joystick.is_moving:
		$Knight/AnimationPlayer.play("run")
		$Knight.move($GUI/Joystick.get_velo())
	else:
		$Knight/AnimationPlayer.play("idle")
