extends Control

func _ready():
	Signals.connect("final",self,"final")


func final():
	get_tree().change_scene("res://scenes/End Screen.tscn")
