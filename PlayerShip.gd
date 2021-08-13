extends KinematicBody2D

export var main_engine_pwr = 0.2
export var thruster_engine_pwr = 0.015
var angular_moment = 0.0
var velocityVector = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation += angular_moment * delta
	move_and_collide( velocityVector * delta)
	# Ship Forward thrust
	if (Input.is_action_pressed("ship_up")):
		velocityVector += Vector2(main_engine_pwr, 0).rotated(rotation)
	if (Input.is_action_just_pressed("ship_up")):
		$MainEngine/Sound.play()
		$MainEngine.show()
	if (Input.is_action_just_released("ship_up")):
		$MainEngine/Sound.stop()
		$MainEngine.hide()
	# Ship Backward thrust
	if (Input.is_action_pressed("ship_down")):
		velocityVector += Vector2(-thruster_engine_pwr, 0).rotated(rotation)
	if (Input.is_action_just_pressed("ship_down")):
		$RetroEngine/Sound.play()
		$RetroEngine.show()
	if (Input.is_action_just_released("ship_down")):
		$RetroEngine/Sound.stop()
		$RetroEngine.hide()
	# Ship Left Rotation
	if (Input.is_action_pressed("ship_left")):
		angular_moment -= thruster_engine_pwr
	if (Input.is_action_just_pressed("ship_left")):
		$LeftRotation/Sound.play()
		$LeftRotation.show()
	if (Input.is_action_just_released("ship_left")):
		$LeftRotation/Sound.stop()
		$LeftRotation.hide()
	# Ship Right Rotation
	if (Input.is_action_pressed("ship_right")):
		angular_moment += thruster_engine_pwr
	if (Input.is_action_just_pressed("ship_right")):
		$RightRotation/Sound.play()
		$RightRotation.show()
	if (Input.is_action_just_released("ship_right")):
		$RightRotation/Sound.stop()
		$RightRotation.hide()	
	
	if (Input.is_action_just_pressed("kill_rotation")):
		angular_moment = 0.0
