extends Node2D

export var scroll_speed = 6.3

func _ready():
	pass # Replace with function body.

func move():
	self.position.x-=scroll_speed
