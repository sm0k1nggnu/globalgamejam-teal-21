extends Node2D

var diff= 0

var scroll_speed = 6.3

func _ready():
	Signals.connect("updatescore",self,"updatescore")
	
	
func updatescore(score):
	diff = score
	scroll_speed = 6.3 + diff
	
	
func move():
	self.position.x -= 6.3

