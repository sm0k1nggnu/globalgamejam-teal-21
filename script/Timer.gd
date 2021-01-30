extends Timer




# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.connect("done",self,"stop")

func _on_Timer_timeout():
	set_wait_time(rand_range(1,3))
	
