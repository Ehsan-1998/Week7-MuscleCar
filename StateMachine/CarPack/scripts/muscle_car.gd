extends VehicleBody3D

@export var engine_force_value := 800.0
@export var brake_force_value := 50.0
@export var steer_angle := 0.4
@onready var  engine_audio: AudioStreamPlayer3D = $CarStartAudio

@onready var camera1 = $Camera1
@onready var camera2 = $Camera2

var fuel: float = 100.0

func _physics_process(delta: float) -> void:
	# --- Camera switching ---
	if Input.is_action_just_pressed("camera1"):
		camera1.current = true
	if Input.is_action_just_pressed("camera2"):
		camera2.current = true

	# --- Reset each frame ---
	engine_force = 0.0

	# --- Forward / backward ---
	if Input.is_action_pressed("up"):
		engine_force = engine_force_value
	elif Input.is_action_pressed("down"):
		engine_force = -engine_force_value

	# --- Steering ---
	var target_steer := 0.0
	if Input.is_action_pressed("left"):
		target_steer = steer_angle
	elif Input.is_action_pressed("right"):
		target_steer = -steer_angle

	steering = lerp(steering, target_steer, delta * 5.0)
	steering = clamp(steering, -steer_angle, steer_angle)
	
	# Play engine when pressing forward
	if Input.is_action_pressed("up"):
		if not engine_audio.playing:
			engine_audio.play()
	else:
	# Stop sound when not accelerating
		if engine_audio.playing:
			engine_audio.stop()
