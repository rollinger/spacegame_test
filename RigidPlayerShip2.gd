extends RigidBody2D

export var main_engine_pwr = 0.2
export var thruster_engine_pwr = 0.015


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_process_rotation(delta)
	_process_impuls(delta)

func _process_impuls(delta):
	if (Input.is_action_pressed("ship_up")):
		apply_impulse($MainEngine/Impulse.position, Vector2(main_engine_pwr, 0))
		#velocityVector += Vector2(main_engine_pwr, 0).rotated(rotation)
	if (Input.is_action_just_pressed("ship_up")):
		$MainEngine/Sound.play()
		$MainEngine.show()
	if (Input.is_action_just_released("ship_up")):
		$MainEngine/Sound.stop()
		$MainEngine.hide()
	# Ship Backward thrust
	if (Input.is_action_pressed("ship_down")):
		apply_impulse($MainEngine/Impulse.position, Vector2(-main_engine_pwr, 0))
		#velocityVector += Vector2(-thruster_engine_pwr, 0).rotated(rotation)
	if (Input.is_action_just_pressed("ship_down")):
		$RetroEngine/Sound.play()
		$RetroEngine.show()
	if (Input.is_action_just_released("ship_down")):
		$RetroEngine/Sound.stop()
		$RetroEngine.hide()

func _process_rotation(delta):
	# Ship Left Rotation
	if (Input.is_action_pressed("ship_left")):
		apply_torque_impulse(-thruster_engine_pwr)
	if (Input.is_action_just_pressed("ship_left")):
		$LeftRotation/Sound.play()
		$LeftRotation.show()
	if (Input.is_action_just_released("ship_left")):
		$LeftRotation/Sound.stop()
		$LeftRotation.hide()
	# Ship Right Rotation
	if (Input.is_action_pressed("ship_right")):
		apply_torque_impulse(thruster_engine_pwr)
	if (Input.is_action_just_pressed("ship_right")):
		$RightRotation/Sound.play()
		$RightRotation.show()
	if (Input.is_action_just_released("ship_right")):
		$RightRotation/Sound.stop()
		$RightRotation.hide()	
	# Kill Rotation
	if (Input.is_action_just_pressed("kill_rotation")):
		applied_torque = 0.0
