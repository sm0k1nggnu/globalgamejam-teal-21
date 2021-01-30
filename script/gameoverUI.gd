extends Control

func _ready():
	Signals.connect("killplayer",self,"gameover")


func gameover():
	get_tree().change_scene("res://scenes/Game Over.tscn")
