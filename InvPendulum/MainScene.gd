extends Node2D

var wheelX = 320.0
var wheelVelocity = 0.0
var barAngle = 90.0				# 単位：degree
var angularVelocity = 0.0

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	pass # Replace with function body.

func _physics_process(delta):
	wheelVelocity = ($Wheel.position.x - wheelX) / delta
	$WheelXLabel.text = "WX: %.1f" % $Wheel.position.x
	$WheelVLabel.text = "WX: %.1f" % wheelVelocity
	wheelX = $Wheel.position.x
	var ba = ($Bar.rotation * 180 / PI)
	$BarALavel.text = "BarA: %.1f" % ba
	$BarAVLavel.text = "BarAV: %.1f" % ((ba - barAngle) / delta)
	barAngle = ba	
	#
	if wheelVelocity == 0.0 && round(barAngle) == 90 && angularVelocity == 0.0:
		if rng.randi_range(0, 1) == 0:
			print("add_central_force(+400)")
			$Wheel.add_central_force(Vector2(400, 0)*delta)
		else:
			print("add_central_force(-400)")
			$Wheel.add_central_force(Vector2(-400, 0)*delta)
	pass
