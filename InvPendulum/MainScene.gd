extends Node2D

var wheelVelocity = 0.0
var barAngle = 90.0
var angularVelocity = 0.0

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if wheelVelocity == 0.0 && barAngle == 90.0 && angularVelocity == 0.0:
		$Wheel.add_central_force(Vector2(10, 0)*delta)
	pass
