extends Area2D

onready var big_circle = $BigCircle
onready var small_circle = $BigCircle/SmallCircle

onready var max_distance = $CollisionShape2D.shape.radius

var event_id = null
var actual_event = null
var touched = false
var last_angle = 0
var is_moving = false

func get_velo():
	var joy_velo = Vector2(0,0)
	joy_velo.x = small_circle.position.x / max_distance
	joy_velo.y = small_circle.position.y / max_distance
	
	return joy_velo


signal touch_released

func _input(event):
	if event is InputEventScreenDrag:
		if event_id == event.index:
			$Timer.wait_time = 0.25
			$Timer.start()
			small_circle.global_position = event.position
			small_circle.position = big_circle.position + (small_circle.position - big_circle.position).clamped(max_distance)
			last_angle = get_velo()
	
	if event is InputEventScreenTouch and not event.is_pressed() and event_id == event.index:
		$Timer.stop()
		emit_signal("touch_released", last_angle)
		is_moving = false
		small_circle.position = Vector2(0,0)
		event_id = null
		touched = false

func _on_Joystick_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch:
		event_id = event.index
		
		if event.is_pressed():
			touched = true


func _on_Timer_timeout():
	is_moving = true
