extends Timer




# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.connect("updatescore",self,"updatescore")

func _on_Timer_timeout():
	pass
	
