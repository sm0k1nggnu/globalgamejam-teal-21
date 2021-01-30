extends RichTextLabel

func _ready():
	self.text = " " + String(Globals.score)
