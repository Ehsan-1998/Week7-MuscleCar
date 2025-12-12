extends State

func enter(_msg := {}) -> void:
	print("Out of fuel!")
	
	%MuscleCar.engine_force_value = 0
	$"../../Smoke".emitting = false
