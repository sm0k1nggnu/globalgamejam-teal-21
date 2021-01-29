extends Timer

var diff = 0
var time = 1



# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.connect("updatescore",self,"updatescore")

func updatescore(score):
	diff = String(score)

func _on_Timer_timeout():
	
	var time = float(diff)/30
	print(time)
	set_wait_time((rand_range(0.1,1.5)-rand_range(0,time)))
	
