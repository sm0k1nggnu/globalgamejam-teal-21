extends Node2D

export var scroll_speed = 2

func _ready():
	pass # Replace with function body.

func move_cloud():
	self.position.x-=scroll_speed
