extends Control



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Play_again_pressed():
	Globals.score = 0
	get_tree().change_scene("res://scenes/Z_Endless.tscn")


func _on_Credits_pressed():
	get_tree().change_scene("res://scenes/Credits.tscn")


func _on_Quit_pressed():
	get_tree().change_scene("res://scenes/title_screen.tscn")
