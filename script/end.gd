extends "ScrollMovement.gd"

var stop = 0

func _physics_process(delta):
	if stop == 0:
		move()
	
func _on_Pickup_body_entered(body):
	if body.name == "Player":
		Signals.emit_signal("end")
		stop = 1
		
