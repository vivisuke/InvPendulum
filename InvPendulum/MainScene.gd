extends Node2D

var wheelX = 320.0
var wheelVelocity = 0.0
var barAngle = 90.0
var angularVelocity = 0.0

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	wheelVelocity = ($Wheel.position.x - wheelX) / delta
	$WheelXLabel.text = "WX: %.1f" % $Wheel.position.x
	$WheelVLabel.text = "WX: %.1f" % wheelVelocity
	wheelX = $Wheel.position.x
	if wheelVelocity == 0.0 && barAngle == 90.0 && angularVelocity == 0.0:
		$Wheel.add_central_force(Vector2(10, 0)*delta)
	pass
