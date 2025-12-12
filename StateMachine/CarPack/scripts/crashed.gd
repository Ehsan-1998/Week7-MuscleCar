extends State

@onready var car = %MuscleCar

func enter(_msg := {}) -> void:
	print("Crashed!")
	car.engine_force = 0
	car.steering = 0

	# Optional crash sound
	if $"../.."/CrashAudio:
		$"../.."/CrashAudio.play()

	# Optional delay before resetting
	await get_tree().create_timer(2.0).timeout
	state_machine.transition_to("Idle")
