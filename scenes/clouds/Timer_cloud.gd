extends Timer

var diff = 0
var time = 1



# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.connect("updatescore",self,"updatescore")

func _on_Timer_timeout():
	set_wait_time(rand_range(4,8))
	
