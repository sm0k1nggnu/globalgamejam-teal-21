extends Control

func _ready():
	Signals.connect("killplayer",self,"gameover")


func _on_Button_pressed():
	print("re")
	get_tree().reload_current_scene()


func gameover():
	self.show()
