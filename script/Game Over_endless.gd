extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Retry_pressed():
	Globals.score = 0
	get_tree().change_scene("res://scenes/Z_Endless.tscn")


func _on_Quit_pressed():
	get_tree().change_scene("res://scenes/title_screen.tscn")


func _on_Credits_pressed():
	get_tree().change_scene("res://scenes/Credits.tscn")
