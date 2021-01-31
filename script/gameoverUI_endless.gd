extends Control

func _ready():
	Signals.connect("death",self,"end")


func end():
	print("switch")
	get_tree().change_scene("res://scenes/GameOver_endless.tscn")
