extends "ScrollMovement_fly.gd"

var speed = 0

func _ready():
	self.global_position.y = rand_range(200,500)
	Signals.connect("updatescore",self,"updatescore")

func updatescore(score):
	speed = score

func _physics_process(delta):
	move();
	
func _on_Pickup_body_entered(body):
	if body.name == "Player":
		Signals.emit_signal("rewardplayer",1)
		queue_free()
