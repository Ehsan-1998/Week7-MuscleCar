extends State

@onready var car = %MuscleCar

const REFUEL_RATE := 20.0  # fuel per second
const MAX_FUEL := 100.0

func enter(_msg := {}) -> void:
	print("Refueling started")
	car.engine_force = 0
	car.steering = 0
	$"../.."/CarStartAudio.stop()

func physics_update(delta: float) -> void:
	car.fuel += REFUEL_RATE * delta
	car.fuel = clamp(car.fuel, 0, MAX_FUEL)
	print("Fuel:", car.fuel)

	if car.fuel >= MAX_FUEL:
		state_machine.transition_to("Idle")
