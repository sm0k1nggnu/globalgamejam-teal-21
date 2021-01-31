extends Node2D



var scroll_speed = 6.3

func _ready():
	pass
	
	
func move():
	scroll_speed = 6.3 + (Globals.score/2) 
	self.position.x -= scroll_speed

