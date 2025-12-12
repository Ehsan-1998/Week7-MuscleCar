extends State

@onready var vehicule = %MuscleCar

const IDLE_THRESHOLD := 0.1

func enter(_msg := {}) -> void:
	print("Entered Idle")

func handle_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		state_machine.transition_to("Stopped")

func physics_update(_delta: float) -> void:
	# If the car starts moving, go to Moving state
	if vehicule.linear_velocity.length() > IDLE_THRESHOLD:
		state_machine.transition_to("Moving")
