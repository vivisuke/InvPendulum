extends Node2D

var wheelX = 320.0
var wheelVelocity = 0.0
var barAngle = 90.0				# 単位：degree
var angularVelocity = 0.0

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	pass # Replace with function body.
func log2(x) -> int:
	#x = round(x)
	if round(x) == 0: return 0
	var positive = true
	if x < 0:
		positive = false
		x = -x
	var l2 = round(log(x) / log(2.0))
	#if l2 > 7: l2 = 7
	if positive:
		return int(l2)
	else:
		return -int(l2)
func _physics_process(delta):
	wheelVelocity = ($Wheel.position.x - wheelX) / delta
	$WheelXLabel.text = "WX: %.1f" % $Wheel.position.x
	$WheelVLabel.text = "WV: %.1f" % wheelVelocity
	wheelX = $Wheel.position.x
	var ba = ($Bar.rotation * 180 / PI)
	$BarALavel.text = "BarA: %.1f" % ba
	var bav = (ba - barAngle) / delta
	$BarAVLavel.text = "BarAV: %.1f" % bav
	barAngle = ba
	#
	print("WX: ", clamp(log2(($Wheel.position.x-320)/10), -7, 7))
	print("WV: ", clamp(log2(wheelVelocity), -7, 7))
	print("BarA: ", clamp(log2(barAngle - 90), -7, 7))
	print("BarAV: ", clamp(log2(bav), -7, 7))
	#
	if wheelVelocity == 0.0 && round(barAngle) == 90 && angularVelocity == 0.0:
		if rng.randi_range(0, 1) == 0:
			print("add_central_force(+400)")
			$Wheel.add_central_force(Vector2(400, 0)*delta)
		else:
			print("add_central_force(-400)")
			$Wheel.add_central_force(Vector2(-400, 0)*delta)
	pass
