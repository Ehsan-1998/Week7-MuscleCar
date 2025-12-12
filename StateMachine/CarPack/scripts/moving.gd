extends State

@onready var vehicule = %MuscleCar

const IDLE_THRESHOLD := 0.1
const FUEL_CONSUMPTION_RATE := 0.2    # much smaller value

func physics_update(delta: float) -> void:
	# If speed is very low → back to Idle
	if vehicule.linear_velocity.length() <= IDLE_THRESHOLD:
		state_machine.transition_to("Idle")

	# Consume fuel gradually ONLY when pressing forward
	if Input.is_action_pressed("ui_up"):
		vehicule.fuel -= FUEL_CONSUMPTION_RATE * delta
		vehicule.fuel = max(vehicule.fuel, 0)

	print("Fuel:", vehicule.fuel)

	# If fuel is empty, then switch to OutOfFuel
	if vehicule.fuel <= 0:
		print("Out of fuel!")
		state_machine.transition_to("OutOfFuel")
