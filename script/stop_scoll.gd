extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.connect("end",self,"ending")

func ending():
	print("stop")
	self.material.set_shader_param("scroll_speed", 0)

