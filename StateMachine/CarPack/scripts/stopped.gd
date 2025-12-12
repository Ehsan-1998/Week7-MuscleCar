extends State

@onready var vehicule  = $"../.."

var previous_engine_force: float


func enter(_msg := {}) -> void:
	print("Entered stopped")
	previous_engine_force = vehicule.engine_force_value
	vehicule.engine_force_value = 0
	$"../../Smoke".emitting = false
	
	

func handle_input(_event: InputEvent):
	if Input.is_action_just_pressed("ui_accept"):
		state_machine.transition_to("Idle")
		
		
func exit() -> void:
	$"../../CarStartAudio".play()
	$"../../Smoke".emitting = true
	vehicule.engine_force_value = previous_engine_force
