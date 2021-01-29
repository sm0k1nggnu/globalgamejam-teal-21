extends "ScrollMovement.gd"

func _ready():
	self.global_position.y = rand_range(100,500)

func _physics_process(delta):
	move()
	
func _on_Pickup_body_entered(body):
	if body.name == "Player":
		Signals.emit_signal("rewardplayer",1)
		queue_free()
