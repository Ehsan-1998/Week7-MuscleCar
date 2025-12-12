extends StateMachine

func _physics_process(delta: float) -> void:
	if %MuscleCar.fuel <= 0:
		transition_to("OutOfFuel")
	super(delta)
