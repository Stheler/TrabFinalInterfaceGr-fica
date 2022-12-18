extends KinematicBody2D

const UP_DIRECTION := Vector2.UP
export var speed := 600.0
export var jump_strenght := 1000
export var maximum_jumps:= 3
export var double_jump_strenght:= 1200.0
export var gravity := 4500.0

var _jumps_made := 0
var _velocity := Vector2.ZERO



func _physics_process(delta: float) -> void:
	var _horizontal_direction = (
		Input.get_action_strength("ui_right")
		- Input.get_action_strength("ui_left")
	)
	_velocity.x = _horizontal_direction * speed
	_velocity.y += gravity * delta

	var ta_caindo := _velocity.y > 0.0 and not is_on_floor()
	var ta_pulando := Input.is_action_just_pressed("ui_up")
	var pulo_triplo := Input.is_action_just_pressed("ui_up") and ta_caindo
	var cancelar_pulo := Input.is_action_just_pressed("ui_up") and _velocity.y < 0.0
	var ta_parado := is_on_floor() and is_zero_approx(_velocity.x)
	
	if ta_pulando and _jumps_made <= maximum_jumps:
		_velocity.y = -jump_strenght
		_jumps_made += 1
	elif pulo_triplo:
		_jumps_made += 1
		if _jumps_made <= maximum_jumps:
			_velocity.y = -double_jump_strenght
	elif cancelar_pulo:
		_velocity.y = 0.0
	elif ta_parado:
		_jumps_made = 0
	
	_velocity = move_and_slide(_velocity, UP_DIRECTION)




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
